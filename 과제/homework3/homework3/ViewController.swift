//
//  ViewController.swift
//  homework3
//
//  Created by Hongdonghyun on 2019/11/25.
//  Copyright © 2019 hong3. All rights reserved.
//

/*
 1. ViewController 데이터 전달
 > AViewController 와 BViewController 를 만든 뒤, 각각 하나씩의 Label 생성
 > A와 B를 화면 전환할 때마다 각 Label에 전환 횟수 1씩 증가
   e.g. A에서 B로 갈 때 1, B에서 다시 A로 넘어올 때 2, 다시 A에서 B로 가면 3
 */

import UIKit

class ViewController: UIViewController {
    let countLabel = UILabel()
    let button = UIButton(type: .system)
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        setUpLabel()
    }
    
    // viewWillAppear (뷰가 나타날것) -> 다른뷰를 왔다 갔다할때 호출
    
    private func setUpLabel() {
        countLabel.frame.size = CGSize(width: 50, height: 100)
        countLabel.center.y = view.center.y - 100
        countLabel.center.x = view.center.x + 25
        view.addSubview(countLabel)
    }
    
    private func setUpButton() {
        
        button.frame.size = CGSize(width: 50, height: 100)
        button.center = view.center
        button.setTitle("다음", for: .normal)
        button.addTarget(self,action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc private func didTapButton(_ sender:UIButton) {
        let nextVC = NextViewController()
        count += 1
        nextVC.count = count
        countLabel.isHidden = true
        present(nextVC, animated: true)
    }

}

