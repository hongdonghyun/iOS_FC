//
//  ViewController.swift
//  ViewLifeCyclePractice
//
//  Created by Hongdonghyun on 2019/11/27.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let nextButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("call first view")
        view.backgroundColor = .systemPink
        initialNextButton()
    }
    
    func initialNextButton() {
        nextButton.frame.size = CGSize(width: 100, height: 100)
        nextButton.center = view.center
        nextButton.setTitle("다음 뷰", for: .normal)
        nextButton.addTarget(self, action: #selector(actionNextButton), for: .touchUpInside)
        view.addSubview(nextButton)
    }
    
    @objc func actionNextButton() {
        let nextView = SecondViewController()
        present(nextView,animated: true)
    }
    
    
    // viewWillAppear (뷰가 나타날것) -> 다른뷰를 왔다 갔다할때 호출
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    // viewDidAppear (뷰가 나타났다) -> 뷰가 화면에 나타난 직후
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    // viewWillDisappear (뷰가 사라질 것이다) -> 뷰가 사라지기 직전
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    

    //viewDidDisappear(뷰가 사라졌다) -> 뷰컨트롤러가 뷰가 제거되었음을 알려줌
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    


}

