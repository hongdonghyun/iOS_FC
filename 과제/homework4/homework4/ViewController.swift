//
//  ViewController.swift
//  homework4
//
//  Created by Hongdonghyun on 2019/11/26.
//  Copyright © 2019 hong3. All rights reserved.
//

/*
 1. 영상 파일 참고
 > 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
 > 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
 > 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20
 */


import UIKit

class ViewController: UIViewController {
    lazy var maxWidth = view.frame.size.width
    lazy var maxHeight = view.frame.size.height
    
    let textLabel = UILabel()
    let textField = UITextField()
    let someButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
        setUpTextField()
        textField.addTarget(self, action: #selector(EditingDidBegin(_:)), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(EditingDidEnd(_:)), for: .editingDidEnd)
        textField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tap)
        view.addSubview(someButton)
    }
    
    @objc func handleTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @objc func EditingDidBegin(_ sender: UITextField) {
        textLabel.font = .systemFont(ofSize: 40)
        textLabel.textColor = .blue
    }
    
    @objc func EditingDidEnd(_ sender: UITextField) {
        textLabel.font = .systemFont(ofSize: 20)
        textLabel.textColor = .red
        
    }
    @objc func editingChanged(_ sender: UITextField) {
        textLabel.text = sender.text ?? ""
    }
    
    func setUpLabel() {
        textLabel.frame.size = CGSize(width: view.frame.size.width, height: 100)
        textLabel.textAlignment = .center
        textLabel.center.y = 100
        view.addSubview(textLabel)
        
    }

    func setUpTextField() {
        textField.frame.size = CGSize(width: view.frame.size.width, height: 100)
        textField.center.y = 300
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.placeholder = "아무거나 입력하세요."
        textField.tag = 0
        view.addSubview(textField)
    }

}

