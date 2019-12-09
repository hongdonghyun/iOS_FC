//
//  ViewController.swift
//  Singleton,UserDefault
//
//  Created by Hongdonghyun on 2019/12/06.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let singletonButton = UIButton(type: .system)
    let userDefaultButton = UIButton(type: .system)
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        addActions()
        
    }
    
    private func setUpUI() {
        let midX = view.frame.midX/2
        let font30 = UIFont.systemFont(ofSize: 30)
        
        textField.frame = CGRect(x: midX, y: 200, width: 200, height: 30)
        textField.becomeFirstResponder()
        textField.backgroundColor = .systemPink
        
        
        singletonButton.frame = CGRect(x: midX, y: 308, width: 200, height: 100)
        singletonButton.setTitle("singleton", for: .normal)
        singletonButton.titleLabel?.font = font30
        
        
        userDefaultButton.frame = CGRect(x: midX, y: 408, width: 200, height: 100)
        userDefaultButton.setTitle("userDefault", for: .normal)
        userDefaultButton.titleLabel?.font = font30
        
        view.addSubview(textField)
        view.addSubview(singletonButton)
        view.addSubview(userDefaultButton)
    }

    private func addActions() {
        self.singletonButton.addTarget(
            self, action: #selector(
                buttonAction(_:)
            ),
            for: .touchUpInside)
        self.userDefaultButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        guard let text = textField.text else { return }
        let secondVC = SecondViewController()
        
        if sender == singletonButton {
            let singletonObj = Singleton.shared
            secondVC.pressButtonType = .singleton
            singletonObj.text = text
        } else {
            secondVC.pressButtonType = .userdefaults
            UserDefaults.standard.set(text, forKey: "text")
        }
        present(secondVC, animated: true)
        
    }
}

