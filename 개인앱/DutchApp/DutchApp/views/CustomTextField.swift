//
//  CustomTextField.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/20.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont(name: "NanumSquareRoundR", size: 15)
        
        self.dynamicFont()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
