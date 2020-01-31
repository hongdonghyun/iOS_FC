//
//  Extensions.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/20.
//  Copyright © 2020 hong3. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


extension UITextField {
    func dynamicFont() {
        let currentFontName = self.font?.fontName
        var calculatedFont: UIFont?
        let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        var size = self.font?.pointSize ?? 15
        switch SCREEN_HEIGHT {
        case 480.0: //Iphone 3,4S
            size *= 0.7
            
        case 568.0: //iphone 5, SE
            size *= 0.8
            
        case 667.0: //iphone 6, 6s, 7, 8
            size *= 0.9
            
        case 736.0: //iphone 6s+ 6+, 7+, 8+
            size *= 0.95
            
            //        case 812.0: //iphone X, XS
        //        case 896.0: //iphone XR => 6.1 inch
        default:
            break
        }
        calculatedFont = UIFont(name: currentFontName!, size: size)
        resizeFont(calculatedFont: calculatedFont)
    }
    
    private func resizeFont(calculatedFont: UIFont?) {
        self.font = calculatedFont
        self.font = UIFont.systemFont(ofSize: calculatedFont!.pointSize)
    }
}

extension UILabel {
    func dynamicFont() {
        let currentFontName = self.font.fontName
        var calculatedFont: UIFont?
        let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        var size = self.font?.pointSize ?? 15
        
        switch SCREEN_HEIGHT {
        case 480.0: //Iphone 3,4S
            size *= 0.7
            
        case 568.0: //iphone 5, SE
            size *= 0.8
        
        case 896.0: //iphone XR => 6.1 inch
            size *= 1.15
//        case 667.0: //iphone 6, 6s, 7, 8
//
//        case 736.0: //iphone 6s+ 6+, 7+, 8+
            
            //        case 812.0: //iphone X, XS
                
        default:
            break
        }
        
        calculatedFont = UIFont(name: currentFontName, size: size)
        resizeFont(calculatedFont: calculatedFont)
    }
    
    private func resizeFont(calculatedFont: UIFont?) {
        self.font = calculatedFont
        self.font = UIFont.systemFont(ofSize: calculatedFont!.pointSize)
    }
}
