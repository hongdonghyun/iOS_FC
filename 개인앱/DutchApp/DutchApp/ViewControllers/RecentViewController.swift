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
    private var items: [String] = ["밥플러스", "패스트캠퍼스"]
    private var dates: [String] = ["2019-01-20", "2019-01-21"]
    private var amounts: [String] = ["10,000", "20,000"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(RecentItemCell.self, forCellReuseIdentifier: "itemCell")
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}

extension RecentViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! RecentItemCell
        let name = items[indexPath.row]
        let date = dates[indexPath.row]
        let amount = amounts[indexPath.row]
        cell.config(itemName: name, saveDate: date, amount: amount)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click\(indexPath.row)")
    }
}
