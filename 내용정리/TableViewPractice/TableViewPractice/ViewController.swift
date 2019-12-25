//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Hongdonghyun on 2019/12/24.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

protocol FirstViewDelegate {
    func loadNewScreen(cell: CustomCell)
}

class ViewController: UIViewController {
    @IBOutlet weak var myTable: UITableView!
    
    let imageArray = ["Dog", "Cloud1", "Cloud2", "Cloud3", "Cloud4", "Cloud5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else { return UITableViewCell() }
        
        cell.config(
            image: UIImage(named: imageArray[indexPath.row]),
            text: imageArray[indexPath.row]
        )
        cell.delegate = self
        return cell
    }

}

extension ViewController: FirstViewDelegate {
    func loadNewScreen(cell: CustomCell) {
        guard let index = myTable.indexPath(for: cell) else { return }
        guard let detailVC = storyboard?.instantiateViewController(identifier: "DetailViewController"),
            let vc = detailVC as? DetailViewController else { return }
        
        vc.detailText = imageArray[index.row]
        vc.detailImg = UIImage(named: imageArray[index.row])!
        navigationController?.pushViewController(detailVC, animated: true)
//        push(detailVC, animated: true)
        
        
        
//        guard
//            let navi = storyboard?.instantiateViewController(identifier: "Navi"),
//            let naviVC = navi as? UINavigationController,
//            let detailVC = naviVC.viewControllers.first as? DetailViewController
//            else { return }
//
//        detailVC.detailText = imageArray[index.row]
//        detailVC.detailImg = UIImage(named: imageArray[index.row])!
//        naviVC.modalPresentationStyle = .fullScreen
//        present(naviVC, animated: true)

    }
    
    
}
