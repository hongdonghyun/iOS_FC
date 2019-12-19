//
//  TableViewRefresh.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewRefresh: UIViewController {
    
    /***************************************************
     UIRefreshControl을 이용해 목록을 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     e.g.
     20개 출력 시, 랜덤 숫자의 범위는 0 ~ 70
     40개 출력 시, 랜덤 숫자의 범위는 0 ~ 90
     
     < 참고 >
     (0...10).randomElement()  -  0부터 10사이에 임의의 숫자를 뽑아줌
     ***************************************************/
    
    let data = 20
    let dataRange = 50
    lazy var randomData = randomWithoutDuplication()
    
    override var description: String {
        return "Practice 3 - Refresh"
    }
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        tableView.dataSource = self
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        view.addSubview(tableView)
        
        refreshControl.tintColor = .blue
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "머기중..")
        tableView.refreshControl = refreshControl
    }
    
    func randomWithoutDuplication() -> [Int] {
        var returnArray: [Int] = []
        while returnArray.count <= data {
            let number = Int.random(in: 0...(data + dataRange))
            if !returnArray.contains(number) {
                returnArray.append(number)
            }
        }
        
        return returnArray
    }
    
    @objc func reloadData() {
        tableView.refreshControl?.endRefreshing()
        randomData = randomWithoutDuplication()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension TableViewRefresh: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        
        cell.textLabel?.text = "\(randomData[indexPath.row])"
        return cell
    }
}
