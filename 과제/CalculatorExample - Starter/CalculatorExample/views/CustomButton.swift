//
//  CustomButton.swift
//  CalculatorExample
//
//  Created by Hongdonghyun on 2019/12/20.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    var cornerRadius: CGFloat = 0 {
      didSet { layer.cornerRadius = cornerRadius }
    }
    
    override func layoutSubviews() {
      super.layoutSubviews()
      cornerRadius = frame.width / 2
    }
}
