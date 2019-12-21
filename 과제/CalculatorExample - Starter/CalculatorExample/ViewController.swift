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
    
    // 입력받은 값
    var inputText = ""
    // 출력될 값
    var value: Double = 0
    // 현재 연산자
    var sign = 0
    // 버튼 활성/비활성
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 계산기 레이블 포매팅
    private func displayFormat() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        let numToString = formatter.string(from: Double(inputText)! as NSNumber)
        displayLabel.text = numToString
    }
    
    // 넘버패드 액션
    @IBAction func numberAction(_ sender: CustomButton) {
        guard flag else { return }
        let senderTag = "\(sender.tag)"
        // 최초 0중복방지
        inputText = displayLabel.text == "0" ? senderTag : inputText + senderTag
        displayFormat()
    }
    
    // 연산자패드
    @IBAction func operatorAction(_ sender: CustomButton) {
        guard flag else { return }
        switch sender.tag {
        // add,sub,div,mul
        case -4 ... -1:
            // 최초입력인 경우
            if sign == 0 {
                value = Double(inputText)!
                inputText = ""
            }
            calculate()
            // 연산자값 변경
            sign = sender.tag
        case -5:
            if sign == 0 {
                inputText = ""
              // ==의 경우
            } else if sign == sender.tag && inputText.isEmpty {
                // 직전 사인값과 현재 사인값이 같은경우
                // ==이 눌렸고 더이상 입력받은값이 없다면
                flag.toggle()
             // += *= 의 경우
            } else if sign != sender.tag && inputText.isEmpty {
                inputText = displayLabel.text!
            }
            calculate()
            sign = sender.tag
        // 초기화
        case -999:
            inputText = "0"
            value = 0
            sign = 0
            displayFormat()
        default:
            print("Operator Error")
        }
        
    }
    
    // 연산로직
    private func calculate() {
        // 입력받은 값이 없으면 튕겨냄
        guard let value2 = Double(inputText) else { return }
        // 현재 연산자에 따라 다른연산
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
        // 연산 후 출력부분
        inputText = String(value)
        displayFormat()
        inputText = ""
    }
}
