//
//  SecondVIewController.swift
//  AlertControllerHong3
//
//  Created by Hongdonghyun on 2019/12/04.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    let alertView = UIView()
    let alertTitleLabel = UILabel()
    let alertMessgeLabel = UILabel()
    let alertTextField = UITextField()
    let alertCancelButton = UIButton()
    let alertOKButton = UIButton()
    
    // viewDidLoad (뷰가 로드됨) -> 초기화작업
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    private func setUpUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        alertView.frame = CGRect(x: 50, y: 230, width: 300, height: 300)
        alertView.backgroundColor = .white
        view.addSubview(alertView)
        
        alertTitleLabel.text = "Title"
        alertTitleLabel.textAlignment = .center
        alertTitleLabel.frame = CGRect(x: 0, y: 30, width: 300, height: 50)
        
        alertMessgeLabel.text = "Message"
        alertMessgeLabel.textAlignment = .center
        alertMessgeLabel.frame = CGRect(x: 0, y: 80, width: 300, height: 100)
        
        alertTextField.frame = CGRect(x: 0, y: 50, width: 300, height: 50)
        alertTextField.becomeFirstResponder()
        alertTextField.borderStyle = .roundedRect
        
        alertView.addSubview(alertTextField)
        alertView.addSubview(alertTitleLabel)
        alertView.addSubview(alertMessgeLabel)
    }
}
