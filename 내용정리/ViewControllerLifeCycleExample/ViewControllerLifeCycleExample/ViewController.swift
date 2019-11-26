//
//  ViewController.swift
//  ViewControllerLifeCycleExample
//
//  Created by Hongdonghyun on 2019/11/25.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---------- viewDidLoad ----------")
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .red
        }
        setUpButton()
        
    }
    
    private func setUpButton() {
        
        button.frame.size = CGSize(width: 50, height: 100)
        button.center = view.center
        button.setTitle("다음", for: .normal)
        button.addTarget(self,action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc private func didTapButton(_ sender:UIButton) {
        let nextVC = NextViewController()
        present(nextVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("--- viewWillAppear ---")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("--- viewDidAppear ---")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("--- viewWillDisappear ---")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("--- viewDidDisappear ---")
    }
    
    deinit {
        print("---------- ViewController deinit ----------")
    }
}

