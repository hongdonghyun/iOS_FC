//
//  ViewController.swift
//  babPlus
//
//  Created by YoujinMac on 2020/02/03.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    private let searchController = UISearchController(searchResultsController: nil)
    private let flowLayout = UICollectionViewFlowLayout()
    private var contents: BabMenu?
    private var branchList = [String]()
    private var branchImagesURL = [String]()
    
    lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
    lazy var itemCount = branchImagesURL.count
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        navigationItem.title = "밥플러스 마이너스"
        searchBarSet()
        setupCollectionView()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        collectionViewInitialization()
        navigationItem.searchController?.isActive = false
    }
    
    
    private func requestData() {
        let APPDELEGATE = UIApplication.shared.delegate as!
        AppDelegate
        contents = APPDELEGATE.dummy!.self
        
        let keys = contents?.contents.keys
        branchList = Array(keys!)
        branchImagesURL = keys!.map { contents?.contents[$0]?.image ?? "" }
//        keys?.forEach {
//            branchImagesURL.append((contents?.contents[$0]?.image ?? ""))
//        }
       itemCount = branchImagesURL.count
    }
    
    // MARK: - collectionView 초기화
    private func collectionViewInitialization() {
        branchList.removeAll()
        branchImagesURL.removeAll()
        
        requestData()
        
        collectionView.reloadData()
    }
    
    
    private func searchBarSet() {

        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "가게명, 메뉴"
        self.navigationItem.searchController = searchController
    }
    
    private func setupCollectionView() {
        setupFlowLayout()
        
        collectionView.backgroundColor = .white
        collectionView.register(MainBranchCollectionViewCell.self, forCellWithReuseIdentifier: MainBranchCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
    }
    
    private func setupFlowLayout() {
        //flowLayout
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
        
    }
}


// MARK: UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainBranchCollectionViewCell.identifier, for: indexPath) as! MainBranchCollectionViewCell
        cell.backgroundColor = .white
        
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    // MARK: - searchBar 검색
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        navigationItem.searchController?.isActive = false
        if searchText.count >= 2 {
            var swapList = [String]()

            contents!.contents.keys.forEach {
                if $0.contains(searchText) {
                    swapList.append($0)
                }
                
                if let filterArray = contents!.contents[$0]?.menus.lunch.filter({ element in element.contains(searchText) }), !filterArray.isEmpty {
                    if !swapList.contains($0) {
                        swapList.append($0)
                    }
                }
                

                if let filterArray = contents!.contents[$0]?.menus.dinner.filter({ element in element.contains(searchText) }), !filterArray.isEmpty {
                    if !swapList.contains($0) {
                        swapList.append($0)
                    }
                }
            
            }
            
            branchList.removeAll()
            branchImagesURL.removeAll()
            branchList = swapList
            branchImagesURL = branchList.map { contents?.contents[$0]?.image ?? "" }
            itemCount = branchImagesURL.count
            
            collectionView.reloadData()
        }
    }
    

    
    
    // MARK: - cancel
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        collectionViewInitialization()
    }
    
}
