//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    var displayText = ""
    var value: Double = 0
    var sign = 0
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func displayTextFormat() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        let numToString = formatter.string(from: Double(displayText)! as NSNumber)
        displayLabel.text = numToString
    }
    
    @IBAction func numberAction(_ sender: CustomButton) {
        guard flag else { return }
        let senderTag = "\(sender.tag)"
        displayText = displayLabel.text == "0" ? senderTag : displayText + senderTag
        displayTextFormat()
    }
    
    private func calculate() {
        guard let value2 = Double(displayText) else { return }
        switch sign {
        case -1:
            value += value2
        case -2:
            value -= value2
        case -3:
            value *= value2
        case -4:
            value /= value2
        case -5,0:
            value = value2
        default:
            print("Calculate Error")
        }
        displayText = String(value)
        displayTextFormat()
        displayText = ""
    }
    
    @IBAction func operatorAction(_ sender: CustomButton) {
        guard flag else { return }
        switch sender.tag {
        case -4 ... -1:
            if sign == 0 {
                value = Double(displayText)!
                displayText = ""
            }
            calculate()
            sign = sender.tag
        case -5:
            if sign == 0 {
                displayText = ""
            } else if sign == sender.tag && displayText.isEmpty {
                flag.toggle()
            } else if sign != sender.tag && displayText.isEmpty {
                displayText = displayLabel.text!
            }
            calculate()
            sign = sender.tag
        case -999:
            displayText = "0"
            value = 0
            sign = 0
            displayTextFormat()
        default:
            print("Operator Error")
        }
    }
}
