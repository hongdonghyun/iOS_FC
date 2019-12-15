//
//  SecondViewController.swift
//  delegatePractice
//
//  Created by Hongdonghyun on 2019/12/10.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    var myLabelText = ""
    var delegate: CustomDelegateB?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = myLabelText
        
        
    }
    
}

extension SecondViewController: CustomDelegateA {
    func sendText(_ data: String) {
        print("CustomDelegateA sendText")
        myLabelText = data
    }
    
    
}
