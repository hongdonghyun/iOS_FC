//
//  TableViewAccessoryType.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewAccessoryType: UIViewController {
    
    /***************************************************
     - 미리 정해진 동물의 이미지와 텍스트를 테이블뷰에 표현
     - 각 셀의 크기는 80
     - 셀을 선택하면 체크박스가 나타나고 다시 선택하면 체크표시가 해제되도록 구현
     
     도전 과제)
     테이블뷰의 각 셀을 위아래로 스크롤 했다가 다시 나타낼 때, 체크 표시가 기존에 했던 곳에 정확히 다시 나타나도록 구현
     ***************************************************/
    
    override var description: String {
        return "Task 2 - AccessoryType"
    }
    
    let animals = [
        "bear", "buffalo", "camel", "dog", "elephant",
        "koala", "llama", "panda", "lion", "horse",
        "guinea_pig", "koala", "whale_shark", "whale", "duck",
        "seagull", "black_swan", "peacock", "giraffe"
    ]
    
    var animalOrdered: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        view.addSubview(tableView)
        animalOrdered = Array(repeating: false, count: animals.count)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    }
}


extension TableViewAccessoryType: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.imageView?.image = UIImage(named: animals[indexPath.row])
        cell.accessoryType = animalOrdered[indexPath.row] ? .checkmark : .none
        return cell
    }
    
}

extension TableViewAccessoryType: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let accessory = tableView.cellForRow(at: indexPath) else { return nil }
        
        switch accessory.accessoryType {
        case .none:
            accessory.accessoryType = .checkmark
            animalOrdered[indexPath.row] = true
        case .checkmark:
            accessory.accessoryType = .none
            animalOrdered[indexPath.row] = false
        default:
            fatalError()
        }
        
        return indexPath
    }
    
}
