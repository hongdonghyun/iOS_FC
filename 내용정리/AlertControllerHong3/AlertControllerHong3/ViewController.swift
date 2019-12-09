//
//  ViewController.swift
//  AlertControllerHong3
//
//  Created by Hongdonghyun on 2019/12/04.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let titleLabel = UILabel()
    let alertButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTitle()
        setUpAlertButton()
    }
    
    private func setUpTitle() {
        titleLabel.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        titleLabel.text = "테스트"
        view.addSubview(titleLabel)
        
    }
    
    private func setUpAlertButton() {
        alertButton.frame.size = CGSize(width: 50, height: 100)
        alertButton.center = view.center
        alertButton.setTitle("Alert", for: .normal)
        alertButton.addTarget(self, action: #selector(didTapAlertButton(_:)), for: .touchUpInside)
        view.addSubview(alertButton)
    }
    
    @objc private func didTapAlertButton(_ sender: UIButton) {
        let nextView = SecondViewController()
        nextView.modalPresentationStyle = .overFullScreen
        
        present(nextView, animated: true)
    }
    
}

