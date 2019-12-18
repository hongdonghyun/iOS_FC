//
//  ExtensionTextField.swift
//  LoginPageExample
//
//  Created by Hongdonghyun on 2019/12/13.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit


private var kAssociationKeyMaxLength: Int = 0


// MARK: 언더라인
extension UITextField {
    func textFieldUnderLine(targetView view:UIView, constant: CGFloat) {
        let underLine = UIView()
        underLine.backgroundColor = .black
        underLine.frame.size.height = 1
        underLine.frame.size.width = self.frame.width
        underLine.frame.origin = CGPoint(x: self.frame.origin.x, y: self.frame.maxY + constant)
        view.addSubview(underLine)
    }
}
