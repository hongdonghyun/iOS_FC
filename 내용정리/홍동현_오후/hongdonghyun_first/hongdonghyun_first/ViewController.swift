//
//  ViewController.swift
//  hongdonghyun_first
//
//  Created by Hongdonghyun on 2019/11/29.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let remainLabel = UILabel()
    let remainWonLabel = UILabel()
    let totalPriceLabel = UILabel()
    let totalWonLabel = UILabel()
    let initialBtn = UIButton()
    let submitBtn = UIButton()
    var userRemain = 70000
    var userTotal = 0
    let won = "원"
    @IBOutlet weak var 짜장주문: UIButton!
    @IBOutlet weak var 짬뽕주문: UIButton!
    @IBOutlet weak var 탕수육주문: UIButton!

    @IBOutlet weak var 짜장수량: UILabel!
    @IBOutlet weak var 짬뽕수량: UILabel!
    @IBOutlet weak var 탕수육수량: UILabel!
    
    var orderCnt: [Int:Int] = [1:0,2:0,3:0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpRemain()
        setUpinitBtn()
        setUpTotal()
        setUpSubmitBtn()
        짜장주문.addTarget(self, action: #selector(orders(_:)), for: .touchUpInside)
        짬뽕주문.addTarget(self, action: #selector(orders(_:)), for: .touchUpInside)
        탕수육주문.addTarget(self, action: #selector(orders(_:)), for: .touchUpInside)
        submitBtn.addTarget(self, action: #selector(debitDidTap(_:)), for: .touchUpInside)
        initialBtn.addTarget(self, action: #selector(initial(_:)), for: .touchUpInside)
    }
    
    @objc func debitDidTap(_ sender: UIButton) {
        let debitAlertController = UIAlertController(title: "결제하기", message: nil, preferredStyle: .alert)
        
        var alertOK = UIAlertAction(title: "확인", style: .default)
        if userRemain >= userTotal {
            debitAlertController.message = "총 결제금액은 \(userTotal)원 입니다."
            alertOK = UIAlertAction(title: "확인", style: .default) { _ in self.debit() }
            let alertCancel = UIAlertAction(title: "취소", style: .default)
            debitAlertController.addAction(alertCancel)
        } else {
            debitAlertController.title = "결제실패"
            debitAlertController.message = "소지금이 부족합니다."
        }
        debitAlertController.addAction(alertOK)
        present(debitAlertController,animated: true)
        
    }
    private func debit() {
        userRemain = userRemain - userTotal
        remainWonLabel.text = String(userRemain) + won
        orderInit()
    }
    
    @objc func initial(_ sender: UIButton) {
        orderInit()
        priceInit()
    }
    private func orderInit() {
        orderCnt = [1:0,2:0,3:0]
        userTotal = 0
        totalWonLabel.text = "0" + won
        짜장수량.text = "0"
        짬뽕수량.text = "0"
        탕수육수량.text = "0"
    }
    private func priceInit() {
        userRemain = 70000
        remainWonLabel.text = "\(userRemain)" + won
        totalWonLabel.text = "\(userTotal)" + won
    }
    
    @objc func orders(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            guard let currentCnt = 짜장수량.text, let intCnt = Int(currentCnt) else { return }
            짜장수량.text = String(intCnt + 1)
            orderCnt[1] = orderCnt[1]! + 1
        case 1:
            guard let currentCnt = 짬뽕수량.text, let intCnt = Int(currentCnt) else { return }
            짬뽕수량.text = String(intCnt + 1)
            orderCnt[2] = orderCnt[2]! + 1
        case 2:
            guard let currentCnt = 탕수육수량.text, let intCnt = Int(currentCnt) else { return }
            탕수육수량.text = String(intCnt + 1)
            orderCnt[3] = orderCnt[3]! + 1
        default:
            return
        }
        changePrice()
        
    }
    
    func changePrice() {
        var innerTotal = 0
        for i in orderCnt {
            if i.key == 1 {
                innerTotal = innerTotal + i.value * 5000
            }
            if i.key == 2 {
                innerTotal = innerTotal + i.value * 6000
            }
            if i.key == 3 {
                innerTotal = innerTotal + i.value * 12000
            }
        }
    totalWonLabel.text = String(innerTotal) + won
    userTotal = innerTotal
    }

    func setUpRemain() {
        remainLabel.frame = CGRect(x: 20, y: 350, width: 80, height: 40)
        remainLabel.text = "소지금"
        remainLabel.backgroundColor = .systemGreen
        remainLabel.textAlignment = .center
        
        remainWonLabel.frame = CGRect(
            x: 110, y: 350, width: 140, height: 40)
        remainWonLabel.text = String(userRemain) + won
        remainWonLabel.backgroundColor = .systemGreen
        remainWonLabel.textAlignment = .right
        
        
        view.addSubview(remainWonLabel)
        view.addSubview(remainLabel)
    }
    
    func setUpinitBtn() {
        initialBtn.frame = CGRect(x: 270, y: 350, width: 80, height: 40)
        initialBtn.setTitle("초기화", for: .normal)
        initialBtn.backgroundColor = .black
        
        view.addSubview(initialBtn)
    }
    
    func setUpTotal() {
        totalPriceLabel.frame = CGRect(x: 20, y: 400, width: 80, height: 40)
        totalPriceLabel.text = "결제금액"
        totalPriceLabel.textAlignment = .center
        totalPriceLabel.backgroundColor = .systemOrange
        
        totalWonLabel.frame = CGRect(x: 110, y: 400, width: 140, height: 40)
        totalWonLabel.text = String(userTotal) + won
        totalWonLabel.textAlignment = .right
        totalWonLabel.backgroundColor = .systemOrange
        
        view.addSubview(totalPriceLabel)
        view.addSubview(totalWonLabel)
        
    }
    
    func setUpSubmitBtn() {
        submitBtn.frame = CGRect(x: 270, y: 400, width: 80, height: 40)
        submitBtn.setTitle("결제", for: .normal)
        submitBtn.backgroundColor = .black
        
        view.addSubview(submitBtn)
    }
}

