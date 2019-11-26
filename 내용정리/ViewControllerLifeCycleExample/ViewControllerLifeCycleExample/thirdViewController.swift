//
//  thirdViewController.swift
//  ViewControllerLifeCycleExample
//
//  Created by Hongdonghyun on 2019/11/25.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    // viewDidLoad (뷰가 로드됨) -> 초기화작업
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setUpButton()
        print("@@@@@@@@@@@ third viewDidLoad @@@@@@@@@@@")
        
    }
    
    private func setUpButton() {
        let aButton = UIButton(type: .system)
        aButton.frame.size = CGSize(width: 100, height: 100)
        aButton.center.y = view.center.y
        aButton.center.x = view.center.x - 100
        aButton.setTitle("A로 돌아가기", for: .normal)
        aButton.setTitleColor(.white, for: .normal)
        aButton.addTarget(self,action: #selector(didTapAButton(_:)), for: .touchUpInside)
        
        let bButton = UIButton(type: .system)
        bButton.frame.size = CGSize(width: 100, height: 100)
        bButton.center.y = view.center.y
        bButton.center.x = view.center.x + 100
        bButton.setTitle("B로 돌아가기", for: .normal)
        bButton.setTitleColor(.white, for: .normal)
        bButton.addTarget(self,action: #selector(didTapBButton(_:)), for: .touchUpInside)
        
        view.addSubview(aButton)
        view.addSubview(bButton)
    }
    
    @objc private func didTapAButton(_ sender: UIButton) {
        print("click a button")
    }
    
    @objc private func didTapBButton(_ sender: UIButton) {
        print("click b button")
    }
    
    // viewWillAppear (뷰가 나타날것) -> 다른뷰를 왔다 갔다할때 호출
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("@@@ viewWillAppear @@@")
    }
    
    // viewDidAppear (뷰가 나타났다) -> 뷰가 화면에 나타난 직후
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("@@@ viewDidAppear @@@")
    }
    
    // viewWillDisappear (뷰가 사라질 것이다) -> 뷰가 사라지기 직전
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("@@@ viewWillDisappear @@@")
    }
    
    //viewDidDisappear(뷰가 사라졌다) -> 뷰컨트롤러가 뷰가 제거되었음을 알려줌
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("@@@ viewDidDisappear @@@")
    }
    
    

    

}
