//
//  RecentViewController.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/20.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class RecentViewController: UITableViewController {
    private let cell = RecentItemCell()
    private var userDataArray: [ItemData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(RecentItemCell.self, forCellReuseIdentifier: "itemCell")
        tableView.rowHeight = UITableView.automaticDimension
        self.navigationItem.title = "최근목록"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let tempArray = userDefault.array(forKey: "info"), !tempArray.isEmpty {
            userDataArray = tempArray.compactMap {
                try? decoder.decode(ItemData.self, from: $0 as! Data)
            }
            tableView.reloadData()
        }
    }
    
}

extension RecentViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userDataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! RecentItemCell
        let userData = userDataArray[indexPath.row]
        cell.config(itemName: userData.itemName, saveDate: userData.saveDate, amount: userData.totalPrice)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = ReceiptViewController()
        let userData = userDataArray[indexPath.row]
        nextVC.receiveItemName = userData.itemName
        nextVC.receiveTotalPrice = userData.totalPrice
        nextVC.receiveTotalPerson = userData.totalPerson
        nextVC.receivePriceN = userData.priceN
        nextVC.receiveBankName = userData.accountInfo?.selectedBank
        nextVC.receiveAccountNumber = userData.accountInfo?.accountNumber
        nextVC.receiveAccountHolder = userData.accountInfo?.accountHolder
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
}
