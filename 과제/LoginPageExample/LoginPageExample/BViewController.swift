//
//  BViewController.swift
//  LoginPageExample
//
//  Created by Hongdonghyun on 2019/12/15.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    private let loginIDLabel = UILabel()
    var loginIDText = ""
    private let backButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginIDLabel.text = loginIDText
        setUpUI()
        
    }
    
    private func setUpUI() {
        loginIDLabel.frame.size = CGSize(width: 100, height: 100)
        loginIDLabel.center.y = view.center.y - 100
        loginIDLabel.center.x = view.center.x
        
        backButton.setTitle("Sign Out", for: .normal)
        backButton.addTarget(self, action: #selector(backBtnAction(_:)), for: .touchUpInside)
        backButton.frame.size = CGSize(width: 100, height: 100)
        backButton.center.y = view.center.y
        backButton.center.x = view.center.x
        
        view.addSubview(backButton)
        view.addSubview(loginIDLabel)
    }
    
    @objc private func backBtnAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

