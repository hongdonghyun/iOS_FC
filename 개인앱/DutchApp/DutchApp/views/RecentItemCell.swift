//
//  RecentItemCell.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/20.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class RecentItemCell: UITableViewCell {
    
    private let itemName: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    private let saveDate: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    private let amount: UILabel = {
        let label = CustomLabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        let UIArray = [itemName, saveDate, amount]
        UIArray.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            itemName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            itemName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            itemName.bottomAnchor.constraint(equalTo: saveDate.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            saveDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            saveDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            amount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func config(itemName name: String, saveDate date: String, amount: String) {
        self.itemName.text = name
        self.saveDate.text = date
        self.amount.text = amount + "원"
    }
}


