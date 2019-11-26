//
//  ViewController.swift
//  homework2
//
//  Created by Hongdonghyun on 2019/11/24.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let itemArray: [String] = ["홍삼","Python","Django","iOS","Swift"]
    let resultLabel = UILabel()
    let toggle = UISwitch()
    lazy var segControl = UISegmentedControl(items: itemArray)
    lazy var superViewHeight = view.frame.size.height
    lazy var superViewWidth = view.frame.size.width

    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialResultLabel()
        initialToggle()
        initalSegControl()
        
    }
    
    func initialResultLabel() {
        resultLabel.frame = CGRect(x: superViewWidth/3, y: superViewHeight - 700, width: superViewWidth/2, height: 100)
        resultLabel.text = String(count)
        resultLabel.isHidden = true
        resultLabel.font = UIFont.systemFont(ofSize: 50)
        view.addSubview(resultLabel)
        
    }
    
    func initalSegControl() {
        segControl.frame = CGRect(x: 0, y: superViewHeight - 400, width: superViewWidth, height: 100)
        segControl.addTarget(self,action: #selector(actionSegControl(_:)), for: .valueChanged)
        view.addSubview(segControl)
    }
    
    func initialToggle() {
        toggle.frame = CGRect(x: 200, y: superViewHeight - 500, width: 100, height: 100)
        toggle.addTarget(self,action: #selector(actionToggle(_:)), for: .valueChanged)
        view.addSubview(toggle)
    }
    
    @objc func actionSegControl(_ sender: UISegmentedControl) {
        resultLabel.text = itemArray[sender.selectedSegmentIndex]
    }
    
    @objc func actionAdd(_ sender: UIButton) {
        count += 1
        resultLabel.text = String(count)
        resultLabel.textColor = .systemBlue
    }
    
    @objc func actionToggle(_ sender: UISwitch) {
        resultLabel.isHidden = !sender.isOn
        print(resultLabel.isHidden)
        print(superViewWidth)
        print(superViewHeight)
    }

}

