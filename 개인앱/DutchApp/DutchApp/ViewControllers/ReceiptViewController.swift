//
//  ReceiptViewController.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/20.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class ReceiptViewController: UIViewController {
    
    private let YMargin: CGFloat = 20
    private let XMargin: CGFloat = 20
    private let sendInfoMargin: CGFloat = 10
    
    private let billScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let billTopView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = CustomLabel()
        label.text = "영 수 증"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private lazy var topDotLine: UILabel = {
        let label = DotLineLabel()
        label.setText(viewFrame: view)
        return label
    }()
    private lazy var middleDotLine: UILabel = {
        let label = DotLineLabel()
        label.setText(viewFrame: view)
        return label
    }()
    
    private let itemNameLabel: UILabel = {
        let label = CustomLabel()
//        label.text = "밥플러스"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let totalPriceLabel: UILabel = {
        let label = CustomLabel()
//        label.text = "10000"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let devideSymbol: UILabel = {
        let label = CustomLabel()
        label.text = "➗"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let totalPersonLabel: UILabel = {
        let label = CustomLabel()
//        label.text = "4명"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let pricePerPersonLabel: UILabel = {
        let label = CustomLabel()
//        label.text = "1인당 2,500원"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let billBottomView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let sendInfoLabel: UILabel = {
        let label = CustomLabel()
        label.text = "[송금정보]"
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private let bankLeftLabel: UILabel = {
        let label = CustomLabel()
        label.text = "은 행 사 명 : "
        return label
    }()
    
    private let bankRightLabel: UILabel = {
        let label = CustomLabel()
//        label.text = "신한"
        return label
    }()
    
    private let accountLeftLabel: UILabel = {
        let label = CustomLabel()
        label.text = "계 좌 번 호 : "
        return label
    }()
    
    private let accountRightLabel: UILabel = {
        let label = CustomLabel()
//        label.text = "110363917368"
        return label
    }()
    
    private let holderLeftLabel: UILabel = {
        let label = CustomLabel()
        label.text = "입 금 자 명 : "
        return label
    }()
    
    private let holderRightLabel: UILabel = {
        let label = CustomLabel()
//        label.text = "홍동현"
        return label
    }()
    
    private let priceLeftLabel: UILabel = {
        let label = CustomLabel()
        label.text = "인 당 금 액 : "
        return label
    }()
    
    private let priceRightLabel: UILabel = {
        let label = CustomLabel()
//        label.text = "2,500원"
        return label
    }()
    
    private lazy var bottomDotLine: UILabel = {
        let label = DotLineLabel()
        label.setText(viewFrame: view)
        return label
    }()
    
    private let publishedLabel: UILabel = {
        let label = UILabel()
        label.text = "발 행 일 시 : "
        return label
    }()
    
    private let publishedDateLabel: UILabel = {
        let label = UILabel()
        label.text = "\(dateToString())"
        return label
    }()
    
    private lazy var publishedBottomDotLine: UILabel = {
        let label = DotLineLabel()
        label.setText(viewFrame: view)
        return label
    }()
    
    private let shareButton: UIButton = {
       let button = CustomButton()
        button.setTitle("  공유하기  ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = mainColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(shareButtonAction(_:)), for: .touchUpInside)
        return button
    }()
    
    private let tossLinkLeftLabel: UILabel = {
        let label = CustomLabel()
        label.text = "토 스 링 크 : "
        return label
    }()
    
    private let tossLinkRightButton: UIButton = {
        let button = CustomButton()
        
        button.setTitle("", for: .normal)
        button.setTitleColor(mainColor, for: .normal)
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(openURL(_:)), for: .touchUpInside)
        return button
    }()
    
    var receiveItemName: String {
        get {
            itemNameLabel.text ?? ""
        }
        set { itemNameLabel.text = newValue }
    }
    var _receiveTotalPrice: String = "10000"
    var receiveTotalPrice: String {
        get {
            _receiveTotalPrice
        }
        set {
            let formattingAmount = amountToString(amount: newValue)
            totalPriceLabel.text = formattingAmount + "원"
            _receiveTotalPrice = formattingAmount
        }
    }
    var receiveTotalPerson: String {
        get {
            totalPersonLabel.text ?? ""
        }
        set { totalPersonLabel.text = newValue + "명" }
    }
    var receiveBankName: String? {
        get {
            bankRightLabel.text ?? ""
        }
        set { bankRightLabel.text = newValue }
    }
    var receiveAccountNumber: String? {
        get {
            accountRightLabel.text ?? ""
        }
        set { accountRightLabel.text = newValue }
    }
    var receiveAccountHolder: String? {
        get {
            holderRightLabel.text ?? ""
        }
        set { holderRightLabel.text = newValue }
    }
    var _receivePriceN: String = "2500"
    var receivePriceN: String {
        get {
            _receivePriceN
        }
        set {
            let formatNewvalue = amountToString(amount: newValue)
            pricePerPersonLabel.text = "1인당 " + formatNewvalue + "원"
            priceRightLabel.text = formatNewvalue + "원"
            _receivePriceN = newValue
        }
    }
    
    var tossLink: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
        view.backgroundColor = .white

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.navigationController?.popViewController(animated: false)
    }

}

extension ReceiptViewController {
    
    private func createShareText() -> String {
        
        var shareText = """
        \t\(receiveItemName) 영수증\n
        발 행 일 : \(dateToString())\n
        ----------------------------\n
        총 액 : \(amountToString(amount: receiveTotalPrice))원\n
        인 원 : \(receiveTotalPerson)\n
        1인당 : \(amountToString(amount: receivePriceN))원\n
        ----------------------------\n
        """
        if let bankName = receiveBankName, let accountNumber = receiveAccountNumber,
            let accountHolder = receiveAccountHolder, !bankName.isEmpty && !accountHolder.isEmpty && !accountNumber.isEmpty && !tossLink.isEmpty {
            shareText += "보 낼 곳 : \(bankName) \(accountNumber) \(accountHolder)\n"
            shareText += "\n"
            shareText += "토 스 : \(tossLink)\n"
            shareText += "----------------------------\n"
        }
        shareText += "지금줄게(iOS) : 링크없음"
        return shareText
    }
    
    @objc private func shareButtonAction(_ sender: UIButton) {
        let activityVC =  UIActivityViewController(activityItems: [createShareText()], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @objc private func openURL(_ sender: UIButton) {
        guard let getLink = sender.titleLabel?.text, let openLink = URL(string: getLink) else { return }
        UIApplication.shared.open(openLink)
    }
    
    private func createTossLink(){
        guard let bankName = receiveBankName, let accountNumber = receiveAccountNumber, !receivePriceN.isEmpty, !bankName.isEmpty, !accountNumber.isEmpty else { return }
        
        SimpleToss().POSTrequest(bank: bankName, account: accountNumber, amount: receivePriceN) { (result) in
                DispatchQueue.main.async {
                    self.tossLinkRightButton.setTitle("\(result.success.link)", for: .normal)

                }
            self.tossLink = result.success.link
            }
    }
}

extension ReceiptViewController {
    private func setUpScrollView() {
        let safeArea = view.safeAreaLayoutGuide
        billScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(billScrollView)
        
        NSLayoutConstraint.activate([
            billScrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            billScrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            billScrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            billScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        ])
        setUpContainerView()
    }
    
    private func setUpContainerView() {
        let safeArea = billScrollView
        billTopView.translatesAutoresizingMaskIntoConstraints = false
        billBottomView.translatesAutoresizingMaskIntoConstraints = false
        billScrollView.addSubview(billTopView)
        billScrollView.addSubview(billBottomView)
        
        NSLayoutConstraint.activate([
            billTopView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            billTopView.bottomAnchor.constraint(equalTo: billBottomView.topAnchor),
            billTopView.widthAnchor.constraint(equalTo: billScrollView.widthAnchor),
            
            billBottomView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            billBottomView.widthAnchor.constraint(equalTo: billScrollView.widthAnchor)
        ])
        setUpTopViewUI()
        setUpBottomViewUI()
    }
    
    private func setUpTopViewUI() {
        let safeArea = billTopView
        let UIArray = [titleLabel, topDotLine, itemNameLabel, totalPriceLabel, devideSymbol, totalPersonLabel, pricePerPersonLabel, middleDotLine]
        
        UIArray.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            billTopView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: YMargin),
            titleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            topDotLine.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            topDotLine.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            itemNameLabel.topAnchor.constraint(equalTo: topDotLine.bottomAnchor, constant: YMargin / 2),
            itemNameLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            totalPriceLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: YMargin / 2),
            totalPriceLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            devideSymbol.topAnchor.constraint(equalTo: totalPriceLabel.bottomAnchor, constant: YMargin / 2),
            devideSymbol.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            totalPersonLabel.topAnchor.constraint(equalTo: devideSymbol.bottomAnchor, constant: YMargin / 2),
            totalPersonLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            pricePerPersonLabel.topAnchor.constraint(equalTo: totalPersonLabel.bottomAnchor, constant: YMargin),
            pricePerPersonLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            middleDotLine.topAnchor.constraint(equalTo: pricePerPersonLabel.bottomAnchor, constant: sendInfoMargin),
            middleDotLine.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            middleDotLine.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
        ])
    }
    
    private func setUpBottomViewUI() {
        let safeArea = billBottomView
        let UIArray  = [sendInfoLabel, bankLeftLabel,bankRightLabel, accountLeftLabel, accountRightLabel, holderRightLabel, holderLeftLabel, bottomDotLine,  publishedLabel, publishedDateLabel, publishedBottomDotLine, shareButton, priceLeftLabel, priceRightLabel, tossLinkLeftLabel, tossLinkRightButton]
        
        UIArray.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            billBottomView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            sendInfoLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: sendInfoMargin),
            sendInfoLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            bankLeftLabel.topAnchor.constraint(equalTo: sendInfoLabel.bottomAnchor, constant: sendInfoMargin),
            bankLeftLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: XMargin),
            
            bankRightLabel.centerYAnchor.constraint(equalTo: bankLeftLabel.centerYAnchor),
            bankRightLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -XMargin),
            
            accountLeftLabel.topAnchor.constraint(equalTo: bankLeftLabel.bottomAnchor, constant: sendInfoMargin),
            accountLeftLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: XMargin),

            accountRightLabel.centerYAnchor.constraint(equalTo: accountLeftLabel.centerYAnchor),
            accountRightLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -XMargin),

            holderLeftLabel.topAnchor.constraint(equalTo: accountLeftLabel.bottomAnchor, constant: sendInfoMargin),
            holderLeftLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: XMargin),

            holderRightLabel.centerYAnchor.constraint(equalTo: holderLeftLabel.centerYAnchor),
            holderRightLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -XMargin),

            priceLeftLabel.topAnchor.constraint(equalTo: holderLeftLabel.bottomAnchor, constant: sendInfoMargin),
            priceLeftLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: XMargin),

            priceRightLabel.centerYAnchor.constraint(equalTo: priceLeftLabel.centerYAnchor),
            priceRightLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -XMargin),

            bottomDotLine.topAnchor.constraint(equalTo: priceLeftLabel.bottomAnchor, constant: sendInfoMargin),
            bottomDotLine.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),

            publishedLabel.topAnchor.constraint(equalTo: bottomDotLine.bottomAnchor, constant: sendInfoMargin),
            publishedLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: XMargin),
            publishedLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -50),

            publishedDateLabel.centerYAnchor.constraint(equalTo: publishedLabel.centerYAnchor),
            publishedDateLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -XMargin),

            publishedBottomDotLine.topAnchor.constraint(equalTo: publishedLabel.bottomAnchor, constant: sendInfoMargin),
            publishedBottomDotLine.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),

            tossLinkLeftLabel.topAnchor.constraint(equalTo: publishedBottomDotLine.bottomAnchor, constant: sendInfoMargin),
            tossLinkLeftLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: XMargin),

            tossLinkRightButton.centerYAnchor.constraint(equalTo: tossLinkLeftLabel.centerYAnchor),
            tossLinkRightButton.leadingAnchor.constraint(equalTo: tossLinkLeftLabel.trailingAnchor),
            tossLinkRightButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -XMargin),

            shareButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            shareButton.topAnchor.constraint(equalTo: tossLinkLeftLabel.bottomAnchor, constant: YMargin),
            shareButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50)
            
        ])
        createTossLink()
    }
}
