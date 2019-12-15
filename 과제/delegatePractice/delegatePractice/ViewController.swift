//
//  ViewController.swift
//  delegatePractice
//
//  Created by Hongdonghyun on 2019/12/10.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTextField: UITextField!
    var delegate: CustomDelegateA?
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "delegateA" {
            let secondVC = segue.destination as! SecondViewController
            self.delegate = secondVC
            delegate?.sendText(myTextField.text ?? "")
        } else {
            let secondVC = segue.destination as! SecondViewController
            secondVC.delegate = self
            secondVC.myLabelText = secondVC.delegate?.sendText() ?? ""
            
            
            
        }
    }
    
    @IBAction func unwindToFirst(_ unwindSegue: UIStoryboardSegue) {
        
    }
}

extension ViewController: CustomDelegateB {
    func sendText() -> String {
        print("customDelegateB sendText")
        return myTextField.text ?? ""
    }
    
    
}

