//
//  TableViewSection.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
    
    /***************************************************
     Data :  0 부터  100 사이에 임의의 숫자
     섹션 타이틀을 10의 숫자 단위로 설정하고 각 섹션의 데이터는 해당 범위 내의 숫자들로 구성
     e.g.
     섹션 0 - 0부터 9까지의 숫자
     섹션 1 - 10부터 19까지의 숫자
     ***************************************************/
    
    override var description: String { "Practice 2 - Section" }
    
    
    let data = Array(Int.random(in: 0...10)...Int.random(in: 11...100))
    var sectionData: [String:[Int]] = [:]
    lazy var sectionHeaders: [String] = sectionData.keys.sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: view.frame)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        sectionData = intSectionSort()
        
    }
    
    func intSectionSort() -> [String:[Int]] {
        var returnDict: [String:[Int]] = [:]
        for i in data {
            let key = String(i/10)
            if returnDict[key] == nil {
                returnDict[key] = [i]
            } else {
                returnDict[key]!.append(i)
            }
        }
        return returnDict
    }


}


// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionData[sectionHeaders[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let section = sectionData[sectionHeaders[indexPath.section]]!
        cell.textLabel?.text = "\(section[indexPath.row])"
        return cell
    }
}
