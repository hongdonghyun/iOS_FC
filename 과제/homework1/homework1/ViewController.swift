//
//  ViewController.swift
//  homework1
//
//  Created by Hongdonghyun on 2019/11/21.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let resultLabel = UILabel()
    let subBtn = UIButton(type: .system)
    let addBtn = UIButton(type: .system)
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.frame = CGRect(x: 200, y: 300, width: 100, height: 100)
        resultLabel.text = String(count)
        resultLabel.font = UIFont.systemFont(ofSize: 50)
        
        addBtn.setTitle("+", for: .normal)
        addBtn.frame = CGRect(x: 20, y: 400, width: 150, height: 50)
        addBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        addBtn.layer.borderWidth = 1
        
        addBtn.addTarget(self, action: #selector(actionAdd(_:)), for: .touchUpInside)
        
        subBtn.setTitle("-", for: .normal)
        subBtn.frame = CGRect(x: 240, y: 400, width: 150, height: 50)
        subBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        subBtn.layer.borderWidth = 1
        
        subBtn.addTarget(self, action: #selector(actionSub(_:)), for: .touchUpInside)
        
        view.addSubview(addBtn)
        view.addSubview(subBtn)
        view.addSubview(resultLabel)
    }
    
    @objc func actionAdd(_ sender: UIButton) {
        count += 1
        resultLabel.text = String(count)
        resultLabel.textColor = .systemBlue
    }
    
    @objc func actionSub(_ sender: UIButton) {
        count -= 1
        resultLabel.text = String(count)
        resultLabel.textColor = .systemRed
    }
}

