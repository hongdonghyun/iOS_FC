//
//  ViewController.swift
//  HelloWorld
//
//  Created by Hongdonghyun on 2019/11/21.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 해당 요소의 속성을 변경
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myView = UIView()
        myView.backgroundColor = .systemGray
        myView.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        myView.center = view.center
        view.addSubview(myView)
        
        myBtn.setTitle("누르세요", for: .normal)
        
        let myBtn2 = UIButton(type: UIButton.ButtonType.detailDisclosure)
        myBtn2.frame = CGRect(x: 100, y: 200, width: 50, height: 50)
        view.addSubview(myBtn2)
        
        myBtn2.addTarget(self, action: #selector(myBtn2Function(_:)), for: .touchUpInside)
        
        
    }
    // 해당 요소의 동작을 변경
    // StoryBoard
    @IBAction func myBtnAction(_ sender: Any) {
        myBtn.setTitle("눌렀어요", for: .normal)
        
    }
    
    @objc func myBtn2Function(_ sender: UIButton) {
        sender.setTitle("바뀌냐", for: .normal)
        sender.setTitleColor(.systemPink, for: .normal)
    }
}


