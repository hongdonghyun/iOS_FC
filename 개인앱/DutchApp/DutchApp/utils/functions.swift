//
//  functions.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/20.
//  Copyright © 2020 hong3. All rights reserved.
//

import Foundation
import UIKit

func dateToString(date: Date = Date()) -> String {
    let now = date
    let today = DateFormatter()
    today.locale = Locale(identifier: "ko_kr")
    today.dateFormat = "yyyy-MM-dd (EE)"
    return today.string(from: now)
}

func amountReplace(_ text: String) -> Int {
    let amount = text.replacingOccurrences(of: ",", with: "")
    if amount.isEmpty {
        return 0
    } else {
        return Int(amount)!
    }
}

func amountToString(amount: String) -> String {
    let numberFormatter = NumberFormatter()
    let amount = amount.replacingOccurrences(of: ",", with: "")
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 3
    return numberFormatter.string(from: NSNumber(value: Int(amount)!))!
}

func getBarButton(_ title : String) -> UIBarButtonItem{
    let customButton =  UIButton.init(type: .custom)
    customButton.setTitle(title, for: .normal)
    customButton.frame = CGRect.init(x: 0, y: 5, width: 140, height: 32)
    customButton.setTitleColor(.white, for: .normal)
    return UIBarButtonItem.init(customView: customButton)
}

func accountFlat(_ bank: String, _ accountNo: String, _ holder: String) -> String {
    return "\(bank) \(accountNo) \(holder)"
}
