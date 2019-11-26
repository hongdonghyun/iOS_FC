//
//  nextViewController.swift
//  ViewControllerLifeCycleExample
//
//  Created by Hongdonghyun on 2019/11/25.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        print("********* NextVC viewDidLoad *********")
        setUpButton()
    }
    
    private func setUpButton() {
        let beforeButton = UIButton(type: .system)
        beforeButton.frame.size = CGSize(width: 50, height: 100)
        beforeButton.center.y = view.center.y
        beforeButton.center.x = view.center.x - 100
        beforeButton.setTitle("이전", for: .normal)
        beforeButton.addTarget(self,action: #selector(didTapBeforeButton(_:)), for: .touchUpInside)
        
        let afterButton = UIButton(type: .system)
        afterButton.frame.size = CGSize(width: 50, height: 100)
        afterButton.center.y = view.center.y
        afterButton.center.x = view.center.x + 100
        afterButton.setTitle("다음", for: .normal)
        afterButton.addTarget(self,action: #selector(didTapAfterButton(_:)), for: .touchUpInside)
        view.addSubview(afterButton)
        view.addSubview(beforeButton)
    }
    
    @objc private func didTapBeforeButton(_ sender:UIButton) {
        // 내가 띄운 뷰 컨트롤러
//        presentedViewController
        // 나를 띄운 뷰 컨트롤러
//        presentingViewController
        // 타입이 다르기 때문에 옵셔널 바인딩으로 확인 후 버튼의 속성을 변경한다.
//        guard let vc = presentingViewController as? ViewController else { return }
//        vc.button.setTitle("클릭", for: .normal)
        
        // 이전화면으로 되돌아가기
        // 두개가 같다.
//        presentingViewController?.dismiss(animated: true)
        dismiss(animated: true)
        
        // 1 -> 2 -> 3
        // presentingViewController?.presentingViewController?.dismiss(animated: true)
        // 1번으로가서 다 닫아버린다.
    }
    
    @objc private func didTapAfterButton(_ sender:UIButton) {
        let nextVC = ThirdViewController()
        present(nextVC, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("*** NextVC viewWillAppear ***")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("*** NextVC viewDidAppear ***")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("*** NextVC viewWillDisappear ***")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("*** NextVC viewDidDisappear ***")
    }
    
    // 소멸자
    deinit {
        print("********* NextVC deinit *********")
    }
    
}
