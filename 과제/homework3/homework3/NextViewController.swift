//
//  NextViewController.swift
//  homework3
//
//  Created by Hongdonghyun on 2019/11/25.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    let countLabel = UILabel()
    let button = UIButton(type: .system)
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        setUpLabel()
    }
    
    // viewWillAppear (뷰가 나타날것) -> 다른뷰를 왔다 갔다할때 호출
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        countLabel.text = String(count)
        print("next view",count)
    }
    
    // viewWillDisappear (뷰가 사라질 것이다) -> 뷰가 사라지기 직전
    override func viewWillDisappear(_ animated: Bool) {
        guard let vc = presentingViewController as? ViewController else { return }
        vc.count = count
        vc.countLabel.isHidden = false
        vc.countLabel.text = String(count)
        super.viewWillDisappear(animated)
    }
    

    
    private func setUpLabel() {
        countLabel.frame.size = CGSize(width: 50, height: 100)
        countLabel.center.y = view.center.y - 100
        countLabel.center.x = view.center.x + 25
        view.addSubview(countLabel)
    }
    
    private func setUpButton() {
        
        button.frame.size = CGSize(width: 50, height: 100)
        button.center = view.center
        button.setTitle("이전", for: .normal)
        button.addTarget(self,action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc private func didTapButton(_ sender:UIButton) {
        count += 1
        dismiss(animated: true)
    }

}
