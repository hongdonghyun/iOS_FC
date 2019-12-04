//
//  SecondViewController.swift
//  ViewLifeCyclePractice
//
//  Created by Hongdonghyun on 2019/11/27.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let beforeButton = UIButton(type: .system)
    
    // viewDidLoad (뷰가 로드됨) -> 초기화작업
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        print("call second view")
        initialBeforeButton()
        
    }
    
    func initialBeforeButton() {
        beforeButton.frame.size = CGSize(width: 100, height: 100)
        beforeButton.center = view.center
        beforeButton.setTitle("이전 뷰", for: .normal)
        beforeButton.setTitleColor(.white, for: .normal)
        beforeButton.addTarget(self, action: #selector(actionBeforeButton), for: .touchUpInside)
        view.addSubview(beforeButton)
    }
    
    @objc func actionBeforeButton() {
        guard let firstView = presentingViewController as? ViewController else { return }
        firstView.dismiss(animated: true)
    }
}
