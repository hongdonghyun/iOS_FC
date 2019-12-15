//
//  SecondViewController.swift
//  Singleton,UserDefault
//
//  Created by Hongdonghyun on 2019/12/06.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let showTextLabel = UILabel()
    let backButton = UIButton(type: .system)
    
    var pressButtonType: PressButtonEnum = .singleton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        typeCheck(value: self.pressButtonType)
        
    }
    
    func setUpUI() {
        view.backgroundColor = .white
        showTextLabel.frame = CGRect(x: 50, y: 200, width: 200, height: 30)
        
        backButton.frame = CGRect(x: view.frame.midX/2, y: 308, width: 200, height: 100)
        backButton.setTitle("돌아가기", for: .normal)
        backButton.titleLabel?.font = .systemFont(ofSize: 30)
        backButton.addTarget(self, action: #selector(btnDismiss(_:)), for: .touchUpInside)
        
        view.addSubview(showTextLabel)
        view.addSubview(backButton)
        
    }
    
    @objc private func btnDismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func typeCheck(value:PressButtonEnum) {
        switch value {
        case .singleton:
            let singleton = Singleton.shared
            showTextLabel.text = singleton.text
        case .userdefaults:
            if let text = UserDefaults.standard.object(forKey: "text") as? String {
                showTextLabel.text = text
            } else {
                showTextLabel.text = "Error"
            }
        }
    }
}
