//
//  CustomButton.swift
//  CalculatorExample
//
//  Created by Hongdonghyun on 2019/12/20.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
    }

}
