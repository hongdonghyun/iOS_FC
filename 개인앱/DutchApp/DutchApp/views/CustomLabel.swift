//
//  CustomLabel.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/20.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.dynamicFont(fontName: "NanumSquareRoundR", fontSize: 15)
        
        self.dynamicFont()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
