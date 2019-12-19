//
//  TableViewBasic.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewBasic: UIViewController {
  
  override var description: String { "TableView - Basic" }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // 테이블 뷰 생성
    let tableView = UITableView(frame: view.frame)
//    let tableView = UITableView(frame: view.frame, style: .grouped)
    tableView.dataSource = self
    view.addSubview(tableView)
    
    // Cell ID 등록
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
  }
}

extension TableViewBasic: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        500
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 매번 cell Instance를 생성하고 있다.
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//        cell.textLabel?.text = "\(indexPath.row)"
        
        
        // cell 재사용 - 미등록 (만들어 쓰는 방식)
//        let cell: UITableViewCell
          // Optional
//        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "CellID") {
//            cell = reusableCell
//        } else {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//        }
        
        
        // cell 재사용 - 선등록 (register,스토리보드)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) // Non Optional
        
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}



