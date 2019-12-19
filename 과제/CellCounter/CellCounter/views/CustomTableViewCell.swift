//
//  CustomTableViewCell.swift
//  CellCounter
//
//  Created by Hongdonghyun on 2019/12/19.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate: class {
    func upCount(_ cell:CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {
    let countLabel = UILabel()
    let countButton = UIButton()
    
    weak var delegate: CustomTableViewCellDelegate?
    var currentIndex: Int = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layoutGuide = contentView.safeAreaLayoutGuide
        
        contentView.addSubview(countButton)
        contentView.addSubview(countLabel)
        countButton.backgroundColor = .yellow
        countButton.setTitle(" MyButton ", for: .normal)
        countButton.setTitleColor(.link, for: .normal)
        
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 10).isActive = true
        countLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        countButton.translatesAutoresizingMaskIntoConstraints = false
        countButton.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -5).isActive = true
        countButton.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -20).isActive = true
        countButton.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 5).isActive = true
        countButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        delegate?.upCount(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
