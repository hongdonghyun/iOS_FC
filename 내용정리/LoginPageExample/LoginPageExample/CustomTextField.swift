//
//  CustomTextField.swift
//  LoginPageExample
//
//  Created by Hongdonghyun on 2019/12/13.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeHolder: String) {
        self.init(frame: CGRect.zero)
        super.placeholder = placeHolder
    }
    
}
