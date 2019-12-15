//
//  CustomView.swift
//  delegateExample
//
//  Created by Hongdonghyun on 2019/12/10.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

// 프로토콜 정의
protocol CustomViewDelegate: class {
    func colorBackground(_ newColor: UIColor?) -> UIColor
}

class CustomView: UIView {
    // delegate property 선언
    weak var delegate: CustomViewDelegate?
    // override property는 observer 불가
    override var backgroundColor: UIColor? {
        get {
            super.backgroundColor
        }
        set {
            // delegate 호출
            let color = delegate?.colorBackground(newValue)
            let newColor = color ?? newValue ?? .black
            super.backgroundColor = newColor
            print("새로 변경된 색은 \(newColor)")
        }
    }
}

