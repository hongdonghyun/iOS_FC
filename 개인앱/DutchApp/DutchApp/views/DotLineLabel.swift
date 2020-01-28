//
//  DotLineLabel.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/21.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class DotLineLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(viewFrame: UIView) {
        self.text = "-"
        let viewWidth = viewFrame.frame.width  - 40
        let labelWidth = self.intrinsicContentSize.width
        self.alpha = 0.5
        self.text = String(repeating: "-", count: Int(viewWidth / labelWidth))
    }
}
