//
//  CustomView.swift
//  ViewLifeCyclePractice
//
//  Created by Hongdonghyun on 2019/11/27.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func request() {
        
    }

}
