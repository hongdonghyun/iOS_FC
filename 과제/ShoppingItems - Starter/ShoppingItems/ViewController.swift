//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 12. 17..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate {
    func addOrder()
}

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    let imageArray = [
        "bokgil", "chapssal", "cloud",
        "cloud2", "cloud3", "dog",
        "firecracker", "iPhone8",
        "iPhoneSE_Gold", "iPhoneSE_RoseGold",
        "iPhoneX_SpaceGray", "iPhoneX_White",
        "lineage", "rabbit","squid"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
        
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell, imageArray.count > indexPath.row else { return UITableViewCell() }
        
        cell.config(
            productImage: UIImage(named: imageArray[indexPath.row]),
            productContent: imageArray[indexPath.row]
        )
        return cell
    }
}

extension ViewController: ViewControllerDelegate {
    func addOrder() {
        
    }
}
