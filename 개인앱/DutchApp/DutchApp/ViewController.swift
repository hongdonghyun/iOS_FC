//
//  ViewController.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/20.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class ViewController: UIViewController {
    
    private let xMargin: CGFloat = 20
    private let yMargin: CGFloat = 20
    private let UIMargin: CGFloat = 50
    private let Padding: CGFloat = 80
    
    private let containerView = UIView()
    private let dateTextButton: UIButton = {
        let button = CustomButton()
        button.setTitle(dateToString(), for: .normal)
        button.backgroundColor = mainColor
        button.addTarget(self, action: #selector(dateTextButtonAction(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let itemLabel: UILabel = {
        let label = CustomLabel()
        label.text = "항목"
        return label
    }()
    
    private let itemTextField: UITextField = {
        let textField = CustomTextField()
        textField.placeholder = "항목을 입력해주세요."
        return textField
    }()
    
    private let amountLabel: UILabel = {
        let label = CustomLabel()
        label.text = "금액"
        return label
    }()
    
    private let amountTextField: UITextField = {
        let textField = CustomTextField()
        textField.placeholder = "금액을 입력하세요."
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let numberOfPersonLabel: UILabel = {
        let label = CustomLabel()
        label.text = "인원 수"
        return label
    }()
    
    private let numberOfPersonTextField: UITextField = {
        let textField = CustomTextField()
        textField.placeholder = "총 인원수를 입력하세요."
        textField.keyboardType = .numberPad
        return textField
    }()
    
    
    private let personSubStepper: UIButton = {
        let button = CustomButton()
        button.setTitle("-", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = mainColor.cgColor
        button.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMinXMinYCorner]
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.setTitleColor(mainColor, for: .normal)
        button.addTarget(self, action: #selector(subButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let personAddStepper: UIButton = {
        let button = CustomButton()
        button.setTitle("+", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = mainColor.cgColor
        button.layer.maskedCorners = [ .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.setTitleColor(mainColor, for: .normal)
        button.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let recentlyUsedAccountButton: UIButton = {
        let button = CustomButton()
        button.setTitle("최근사용계좌", for: .normal)
        button.backgroundColor = mainColor
        button.addTarget(self, action: #selector(recentButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let accountLabel: UILabel = {
        let label = CustomLabel()
        label.text = "계좌정보"
        label.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return label
    }()
    
    private let bankButton: UIButton = {
        let button = CustomButton()
        button.setTitle("은행", for: .normal)
        button.setTitleColor(placeHolderColor, for: .normal)
        button.addTarget(self, action: #selector(bankButtonAction(_:)), for: .touchUpInside)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        return button
    }()
    
    private let accountTextField: UITextField = {
        let textField = CustomTextField()
        textField.placeholder = "계좌번호"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let accountHolderTextField: UITextField = {
        let textField = CustomTextField()
        textField.placeholder = "예금주"
        return textField
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("계산", for: .normal)
        button.addTarget(self, action: #selector(calculateButtonAction), for: .touchUpInside)
        button.backgroundColor = mainColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    private var itemName = ""
    private var selectedBank = ""
    private var numberOfPerson = 1
    private var amount = 0
    private var accountNo = ""
    private var accountHolder = ""
    private var reportingDate = dateToString()
    private var tossLink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "N빵"
        setUpUI()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
        initProperty()
    }
    

}

//MARK: - TextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case amountTextField:
            return string == string.filter("0123456789,".contains)
        case accountTextField:
            return string == string.filter("0123456789".contains)
        default:
            print("pass")
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1) {
            textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: mainColor])
        }
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
        case amountTextField:
            guard let text = textField.text else { return }
            let amount = text.replacingOccurrences(of: ",", with: "")
            if amount.isEmpty {
                amountTextField.text = nil
            } else {
                self.amount = Int(amount)!
                amountTextField.text = amountToString(amount: amount)
            }
            
        default:
            print("pass")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case numberOfPersonTextField:
            if let text = textField.text, let intText = Int(text), intText >= 2 {
                    numberOfPerson = intText
            } else {
                numberOfPerson = 1
                textField.text = nil
            }
        default:
            print("Error")
        }
        UIView.animate(withDuration: 1) {
            textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case numberOfPersonTextField:
            guard let text = numberOfPersonTextField.text else { return false }
            numberOfPerson = Int(text) ?? 2
        default:
            print("Error")
        }
        return true
    }
}

extension ViewController {
    private func saveProperty() {
        itemName = itemTextField.text ?? ""
        amount = amountReplace(amountTextField.text ?? "")
        accountNo = accountTextField.text ?? ""
        accountHolder = accountHolderTextField.text ?? ""
        selectedBank = bankButton.titleLabel?.text ?? ""
    }
    
    private func initProperty() {
        itemName = ""
        selectedBank = ""
        numberOfPerson = 1
        amount = 0
        accountNo = ""
        accountHolder = ""
        reportingDate = dateToString()
        tossLink = ""
        
        let UIArray = [itemTextField, amountTextField, numberOfPersonTextField, accountTextField, accountHolderTextField]
        UIArray.forEach {
            $0.text = nil
        }
        
        bankButton.setTitle("은행", for: .normal)
        bankButton.setTitleColor(placeHolderColor, for: .normal)
    }
}

// MARK: - ACTIONS
extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    @objc private func recentButtonAction(_ sender: UIButton) {
//        guard let userArray = userDefault.array(forKey: "itemData") else { return }
//        var userAccount = [String]()
//        var userAccountSet = Set<String>()
//        var userAccountDict = [ItemData]()
//        for i in userArray {
//            guard let item = try? decoder.decode(ItemData.self, from: i as! Data) else { return }
//            let accountString = accountFlat(item.selectedBank!, item.accountNumber!, item.accountHolder!)
//            userAccount.append(accountString)
//            userAccountSet.insert(accountString)
//            userAccountDict.append(item)
//        }
        let asp = ActionSheetStringPicker(title: "최근사용계좌", rows: [1,2,3,4,5], initialSelection: 0, doneBlock: {
            picker, indexes, values in
//            let bank = userAccountDict[indexes].selectedBank!
//            let accountNumber = userAccountDict[indexes].accountNumber!
//            let holder = userAccountDict[indexes].accountHolder!
//            self.bankButton.setTitle(bank, for: .normal)
//            self.bankButton.setTitleColor(.black, for: .normal)
//            self.selectedBank = bank
//            self.accountTextField.text = accountNumber
//            self.accountNo = accountNumber
//            self.accountHolderTextField.text = holder
//            self.accountHolder = holder
            return
        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender)
        
        asp?.setCancelButton(getBarButton("   취소   "))
        asp?.setDoneButton(getBarButton("   선택   "))
        asp?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        asp?.toolbarBackgroundColor = mainColor
        asp?.show()
        
    }
    
    @objc private func bankButtonAction(_ sender: UIButton) {
        let asp = ActionSheetStringPicker(title: "은행목록", rows: bankArray, initialSelection: 0, doneBlock: {
            picker, indexes, values in
            if let v = values {
                let v = v as! String
                self.selectedBank = v
                sender.setTitle(v, for: .normal)
                sender.setTitleColor(.black, for: .normal)
            }
            return
        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender)
        
        asp?.setCancelButton(getBarButton("   취소   "))
        asp?.setDoneButton(getBarButton("   선택   "))
        asp?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        asp?.toolbarBackgroundColor = mainColor
        asp?.show()
    }
    
    private func TFemptyAction() -> Bool {
        var emptyTFArray = [UITextField]()
        if let item = itemTextField.text, item.isEmpty {
            emptyTFArray.append(itemTextField)
            
        }
        if let person = numberOfPersonTextField.text, person.isEmpty {
            emptyTFArray.append(numberOfPersonTextField)
            
        }
        if let amount = amountTextField.text, amount.isEmpty {
            emptyTFArray.append(amountTextField)
            
        }
        if !emptyTFArray.isEmpty {
            UIView.animateKeyframes(withDuration: 0.3, delay: 0, animations: {
                emptyTFArray.forEach { TF in
                    TF.attributedPlaceholder = NSAttributedString(string: TF.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemRed])
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                        TF.center.x -= 8
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.3, animations: {
                        TF.center.x += 16
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3, animations: {
                        TF.center.x -= 16
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2, animations: {
                        TF.center.x += 8
                    })
                }
            }, completion: { _ in
                emptyTFArray.forEach { TF in
                    TF.attributedPlaceholder = NSAttributedString(string: TF.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
                }
            })
            return false
        }
        else { return true }
    }
    
    @objc private func calculateButtonAction(_ sener: UIButton) {
        guard TFemptyAction() else { return }
        saveProperty()
        let nextVC = ReceiptViewController()
        let _totalPrice = "\(amount)"
        let _totalPerson = "\(numberOfPerson)"
        let _priceN = "\(amount / numberOfPerson)"
        var data = ItemData(saveDate: reportingDate, itemName: itemName, totalPrice: _totalPrice, totalPerson: _totalPerson, priceN: _priceN)
        
        if !accountHolder.isEmpty && !selectedBank.isEmpty && !accountNo.isEmpty {
            data.accountInfo = AccountData(accountHolder: accountHolder, selectedBank: selectedBank, accountNumber: accountNo)
            nextVC.receiveBankName = selectedBank
            nextVC.receiveAccountNumber = accountNo
            nextVC.receiveAccountHolder = accountHolder
        }
        
        if var tempArray = userDefault.array(forKey: "info"), !tempArray.isEmpty {
            tempArray.append(data.encode()!)
            userDefault.set(tempArray, forKey: "info")
        } else { userDefault.set([data.encode()!], forKey: "info"); print("Save2") }
        
        nextVC.receiveItemName = itemName
        nextVC.receiveTotalPrice = _totalPrice
        nextVC.receiveTotalPerson = _totalPerson
        nextVC.receivePriceN = _priceN
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func dateTextButtonAction(_ sender: UIButton) {
        let adp = ActionSheetDatePicker(title: "날짜", datePickerMode: .date, selectedDate: Date(), doneBlock: {
            picker, indexes, values in
            let selectDate = indexes as! Date
            let dateString = dateToString(date: selectDate)
            sender.setTitle(dateString, for: .normal)
            self.reportingDate = dateString
            return
        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender)
        adp?.locale = Locale(identifier: "ko_kr")
        adp?.setCancelButton(getBarButton("   취소   "))
        adp?.setDoneButton(getBarButton("   선택   "))
        adp?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        adp?.toolbarBackgroundColor = mainColor
        adp?.show()
        
    }
    
    @objc private func addButtonAction(_ sender: UIButton) {
        numberOfPerson += 1
        numberOfPersonTextField.text = "\(numberOfPerson)"
    }
    
    @objc private func subButtonAction(_ sender: UIButton) {
        if numberOfPerson <= 2 {
            numberOfPersonTextField.text = nil
            numberOfPerson = 1
        } else {
            numberOfPerson -= 1
            numberOfPersonTextField.text = "\(numberOfPerson)"
        }
        
        
    }
}


// MARK: - UI
extension ViewController {
    private func setUpUI() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        setUpContainerView()
        setUpDelegate()
    }
    
    private func setUpContainerView() {
        let safeArea = containerView.safeAreaLayoutGuide
        let UIArray = [
            dateTextButton, itemLabel, itemTextField, amountLabel, amountTextField, personSubStepper,
            personAddStepper, numberOfPersonLabel, numberOfPersonTextField, recentlyUsedAccountButton, accountLabel,
            bankButton, accountTextField, accountHolderTextField, calculateButton
        ]
        UIArray.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.containerView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            dateTextButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: yMargin / 2),
            dateTextButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            dateTextButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -xMargin),
            
            itemLabel.topAnchor.constraint(equalTo: dateTextButton.bottomAnchor, constant: UIMargin),
            itemLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            itemLabel.widthAnchor.constraint(equalToConstant: Padding),
            
            itemTextField.topAnchor.constraint(equalTo: dateTextButton.bottomAnchor, constant: UIMargin),
            itemTextField.leadingAnchor.constraint(equalTo: itemLabel.trailingAnchor, constant: xMargin),
            itemTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -xMargin),
            
            amountLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: UIMargin),
            amountLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            amountLabel.widthAnchor.constraint(equalToConstant: Padding),
            
            amountTextField.topAnchor.constraint(equalTo: itemTextField.bottomAnchor, constant: UIMargin),
            amountTextField.leadingAnchor.constraint(equalTo: amountLabel.trailingAnchor, constant: xMargin),
            
            numberOfPersonLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: UIMargin),
            numberOfPersonLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            numberOfPersonLabel.widthAnchor.constraint(equalToConstant: Padding),
            
            numberOfPersonTextField.centerYAnchor.constraint(equalTo: numberOfPersonLabel.centerYAnchor),
            numberOfPersonTextField.leadingAnchor.constraint(equalTo: numberOfPersonLabel.trailingAnchor, constant: xMargin),
            numberOfPersonTextField.trailingAnchor.constraint(equalTo: personSubStepper.leadingAnchor),
            
            //            personSubStepper.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: UIMargin),
            personSubStepper.centerYAnchor.constraint(equalTo: numberOfPersonLabel.centerYAnchor),
            personSubStepper.heightAnchor.constraint(equalTo: numberOfPersonTextField.heightAnchor),
            personSubStepper.widthAnchor.constraint(equalTo: personAddStepper.widthAnchor),
            
            personAddStepper.centerYAnchor.constraint(equalTo: numberOfPersonLabel.centerYAnchor),
            personAddStepper.leadingAnchor.constraint(equalTo: personSubStepper.trailingAnchor),
            personAddStepper.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -xMargin),
            personAddStepper.heightAnchor.constraint(equalTo: numberOfPersonTextField.heightAnchor),
            
            recentlyUsedAccountButton.topAnchor.constraint(equalTo: numberOfPersonLabel.bottomAnchor, constant: UIMargin),
            recentlyUsedAccountButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            
            recentlyUsedAccountButton.widthAnchor.constraint(equalToConstant: 120),
            
            accountLabel.topAnchor.constraint(equalTo: recentlyUsedAccountButton.bottomAnchor, constant: UIMargin / 2),
            accountLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            accountLabel.widthAnchor.constraint(equalToConstant: Padding),
            
            bankButton.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 20),
            bankButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: xMargin),
            bankButton.widthAnchor.constraint(equalToConstant: Padding),
            
            accountTextField.centerYAnchor.constraint(equalTo: bankButton.centerYAnchor),
            accountTextField.leadingAnchor.constraint(equalTo: bankButton.trailingAnchor, constant: xMargin),
            accountTextField.widthAnchor.constraint(equalToConstant: 140),
            accountTextField.heightAnchor.constraint(equalTo: bankButton.heightAnchor),
            
            accountHolderTextField.centerYAnchor.constraint(equalTo: bankButton.centerYAnchor),
            accountHolderTextField.leadingAnchor.constraint(equalTo: accountTextField.trailingAnchor),
            accountHolderTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -xMargin),
            accountHolderTextField.heightAnchor.constraint(equalTo: bankButton.heightAnchor),
            
            calculateButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            calculateButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -yMargin),
            calculateButton.widthAnchor.constraint(equalToConstant: 100),
            calculateButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    private func setUpDelegate() {
        let UIArray = [numberOfPersonTextField, itemTextField, amountTextField, accountTextField, accountHolderTextField]
        UIArray.forEach { $0.delegate = self }
        
    }
}
