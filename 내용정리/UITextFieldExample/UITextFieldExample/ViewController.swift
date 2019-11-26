//
//  ViewController.swift
//  UITextFieldExample
//
//  Created by Hongdonghyun on 2019/11/26.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 포커스
        idTextField.becomeFirstResponder()
        // 코드로 할 때
//        idTextField.addTarget(self, action: #selector(EditingDidEnd(_:)), for: .editingDidEnd)
        
    }
    
    @IBAction func EditingDidBegin(_ sender: UITextField) {
        if sender.tag == 0 {
            print("ID 입력창 누름")
        } else {
            print("PWD 입력창 누름")
        }
        
    }
    
    // 텍스트 필드 입력마다 호출
    @IBAction func EditingChanged(_ sender: UITextField) {
        
//        if sender.text!.count > 6 {
            // 키보드를 내림
//            sender.resignFirstResponder()
            // 뷰가 가지고 있는 에디터에게 키보드를 내리게 함
//            view.endEditing(true)
//        }
        
        if sender.tag == 0 {
            print("ID 입력: ",sender.text ?? "")
        } else {
            print("PWD 입력: ",sender.text ?? "")
        }
        
    }
    
    @IBAction func textFieldPrimaryActionTriggered(_ sender: UITextField) {
        if sender.tag == 0 {
            print("ID 엔터!")
        } else {
            print("PWD 엔터!")
        }
        
    }
    
    @IBAction func EditingDidEnd(_ sender: UITextField) {
        if sender.tag == 0 {
            print("ID 입력창 빠져나옴")
        } else {
            print("PWD 입력창 빠져나옴")
        }
        
    }
    
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
        if sender.tag == 0 {
            print("ID 입력창 빠져나오며 키보드가 닫힘")
        } else {
            print("PWD 입력창 빠져나오며 키보드가 닫힘")
        }
    }
    
}

