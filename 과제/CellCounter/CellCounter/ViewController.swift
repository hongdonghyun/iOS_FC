//
//  ViewController.swift
//  CellCounter
//
//  Created by Hongdonghyun on 2019/12/19.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var data = Array(1...50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Custom")
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }

    func setUpUI() {
        tableView.frame = view.frame
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell1 = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as? CustomTableViewCell else { fatalError() }
        cell1.countLabel.text = "\(data[indexPath.row])"
        cell1.delegate = self
        
        return cell1
    }
    
}

extension ViewController: CustomTableViewCellDelegate {
    func upCount(_ cell: CustomTableViewCell) {
        guard let index = tableView.indexPath(for: cell) else { return }
        data[index.row] += 1
        cell.countLabel.text = "\(data[index.row])"
    }
}
