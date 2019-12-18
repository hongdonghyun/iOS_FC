//
//  CustomLogoView.swift
//  LoginPageExample
//
//  Created by Hongdonghyun on 2019/12/13.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class CustomLogoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 5
    }

}
