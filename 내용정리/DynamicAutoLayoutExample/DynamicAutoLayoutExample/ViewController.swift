//
//  ViewController.swift
//  DynamicAutoLayoutExample
//
//  Created by Hongdonghyun on 2019/12/16.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
                UIView.animate(withDuration: 0.5, animations: {
                    self.centerYConstraint.constant = 100
                    self.myView.transform = self.myView.transform.rotated(by: CGFloat(M_PI_2))
                    self.view.layoutIfNeeded()
        
                },completion: { _ in
                    UIView.animate(withDuration: 0.5) {
                        self.centerYConstraint.constant = 0
                        self.myView.transform = self.myView.transform.rotated(by: CGFloat(-M_PI_2))
                        self.view.layoutIfNeeded()
                    }
                })
        
//        UIView.animate(withDuration: 0.1, delay: 0, options: [.repeat],
//                       animations: {
//                        self.centerYConstraint.constant = 100
//                        self.myView.backgroundColor = .red
//                        self.myView.transform = self.myView.transform.rotated(by: CGFloat(3.14))
//                        self.myView.backgroundColor = .magenta
//
//                        self.view.layoutIfNeeded()
//
//        })
    }
    
    
    
}

