//
//  ViewController.swift
//  nestedView
//
//  Created by Hongdonghyun on 2019/11/28.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let viewColor: [UIColor] = [.red, .green, .blue, .gray, .systemPink, .yellow, .brown, .darkGray, .black, .cyan, .orange, .purple]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    // 뷰 셋팅
    func setUpView() {
        var viewFrame = view.frame
        for i in viewColor {
            let innerView = makeView(i, from: viewFrame)
            view.addSubview(innerView)
            viewFrame = innerView.frame
        }
    }
    
    // 뷰 색상 및 사이즈 지정
    func makeView(_ color: UIColor,from frame: CGRect) -> UIView {
        let view = UIView(frame: resizeViewFrame(frame: frame))
        view.backgroundColor = color
        return view
    }
    
    // 뷰 크기 리사이즈
    func resizeViewFrame(frame: CGRect) -> CGRect {
        CGRect(x: frame.minX+30, y: frame.minY+30, width: frame.width-60, height: frame.height-60)
    }
}

