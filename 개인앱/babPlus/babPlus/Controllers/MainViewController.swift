//
//  ViewController.swift
//  babPlus
//
//  Created by YoujinMac on 2020/02/03.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    private let APPDELEGATE = UIApplication.shared.delegate as!
    AppDelegate
    private let searchController = UISearchController(searchResultsController: nil)
    private var contents: BabMenu?
    private var branchList = [String]()
    private var branchImagesURL = [String]()
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        let padding:CGFloat = 10
        let margin:CGFloat = 20
        let itemCount:CGFloat = 2
        let frameWidth = view.frame.width
        
        let contentWidth:CGFloat = frameWidth - (margin * 2) - (padding * (itemCount - 1))
        let itemWidth:CGFloat = (contentWidth / itemCount).rounded(.down)
        
        flowLayout.minimumInteritemSpacing = padding
        flowLayout.minimumLineSpacing = padding
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 20)
        return flowLayout
    }()
    
    private lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        navigationItem.title = "밥플러스 마이너스"
        searchBarSet()
        setupCollectionView()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        collectionViewInitialization()
        navigationItem.searchController?.isActive = false
    }
    
    
    private func loadData() {
        contents = APPDELEGATE.dummy
        let keys = contents?.contents.keys
        branchList = Array(keys!)
        branchImagesURL = keys!.map { contents?.contents[$0]?.image ?? "" }
    }
    
    // MARK: - collectionView 초기화
    private func collectionViewInitialization() {
        branchList.removeAll()
        branchImagesURL.removeAll()
        loadData()
        collectionView.reloadData()
    }
    
}

extension MainViewController {
    private func setupUI() {
        searchBarSet()
        setupCollectionView()
    }
    
    private func searchBarSet() {
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "가게명, 메뉴"
        self.navigationItem.searchController = searchController
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(MainBranchCollectionViewCell.self, forCellWithReuseIdentifier: MainBranchCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
    }
}

// MARK: UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return branchImagesURL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainBranchCollectionViewCell.identifier, for: indexPath) as! MainBranchCollectionViewCell

        cell.configure(branchImageURL: branchImagesURL[indexPath.item], branchName: branchList[indexPath.item])
        return cell
    }
    
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let branchDetailVC = BranchDetailViewController()
        
        branchDetailVC.receiveBranchName = branchList[indexPath.item]
        branchDetailVC.receiveAddress = (contents?.contents[branchList[indexPath.item]]?.address)!
        self.navigationController?.pushViewController(branchDetailVC, animated: true)
    }
}

// MARK: - UISearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        navigationItem.searchController?.isActive = false
        if searchText.count >= 2 {
            branchList.removeAll()
            branchImagesURL.removeAll()
            branchList = contents!.contents.keys.filter { $0.contains(searchText) }
            
            contents!.contents.keys.forEach {
                
                if let filterArray = contents!.contents[$0]?.menus.lunch.filter({ element in element.contains(searchText) }), !filterArray.isEmpty, !branchList.contains($0) {
                        branchList.append($0)
                }
                
                if let filterArray = contents!.contents[$0]?.menus.dinner.filter({ element in element.contains(searchText) }), !filterArray.isEmpty, !branchList.contains($0) {
                        branchList.append($0)
                }
                
            }
            branchImagesURL = branchList.map { contents?.contents[$0]?.image ?? "" }
            collectionView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        collectionViewInitialization()
    }
    
}
