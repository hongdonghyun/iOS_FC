//
//  ViewController.swift
//  LoginPageExample
//
//  Created by Hongdonghyun on 2019/12/13.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit
// 키보드 크기 판단해서 그만큼만 올리기
// 회원가입

class ViewController: UIViewController {
    private let emailTextField: UITextField = {
        let textField = CustomTextField(placeHolder: "이메일을 입력하세요.")
        return textField
    }()
    
    private let emailUnderLine: UIView = {
        let underLine = CustomUnderLine()
        return underLine
    }()
    
    private let pwdUnderLine: UIView = {
        let underLine = CustomUnderLine()
        return underLine
    }()
    
    private let pwdTextField: UITextField = {
        let textField = CustomTextField(placeHolder: "비밀번호를 입력하세요.")
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("Sign In", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let emailThumbnail: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "email")
        return imgView
    }()
    
    private let pwdThumbnail: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "password")
        return imgView
    }()
    
    private let containerView = UIView()
    private var constraintContainerView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        pwdTextField.delegate = self
        setUpUI()
        autoLayout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func handleTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @objc private func signIn (_ sender: UIButton) {
        let signinID = emailTextField.text ?? ""
        let signinPWD = pwdTextField.text ?? ""
        if signinID != ID && signinPWD != PWD {
            UIView.animate(withDuration: 0.7,
               animations: {
                self.pwdTextField.backgroundColor = .red
                self.emailTextField.backgroundColor = .red
                self.pwdTextField.alpha = 0.5
                self.emailTextField.alpha = 0.5
                },
               completion: { finished in
                self.pwdTextField.backgroundColor = .white
                self.emailTextField.backgroundColor = .white
                self.pwdTextField.alpha = 1
                self.emailTextField.alpha = 1
            })
        } else {
            let secondVC = SecondViewController()
            //            secondVC.modalPresentationStyle = .fullScreen
            secondVC.loginIDText = signinID
            present(secondVC, animated: true)
        }
    }
    
    //    func senceChange() {
    //        if #available(iOS 13.0, *) {
    //            // 윈도우 만들기
    //            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
    //                let window = UIWindow(windowScene: windowScene)
    //                //            window.rootViewController = SecondViewController()
    //                // 씬델리게이트에 넣어준다.
    //                let sceneDelegate = windowScene.delegate as? SceneDelegate
    //                sceneDelegate?.window = window
    //                window.makeKeyAndVisible()
    //            }
    //        } else {
    //            let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //            let window = UIWindow(frame: UIScreen.main.bounds)
    //            window.rootViewcontroller = SecondViewController()
    //            window.makeKeyAndVisible()
    //            appDelegate.window = window
    //        }
    //    }
    
    
    
}


extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        var strLimit = 0
        switch textField {
            case emailTextField:
                strLimit = 16
            case pwdTextField:
                strLimit = 16
            default:
                return false
        }
        return text.count <= strLimit
    }
    
    @objc private func keyboardWillShow(_ sender: Notification) {
        UIView.animate(withDuration: 3){
            self.constraintContainerView.constant = -350
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func keyboardWillHide(_ sender: Notification) {
        UIView.animate(withDuration: 3) {
            self.constraintContainerView.constant = -100
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: Setup UI
extension ViewController {
    private func setUpUI() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        signInButton.addTarget(self, action: #selector(signIn(_:)), for: .touchUpInside)
        
        view.addSubview(signInButton)
        view.addSubview(emailTextField)
        view.addSubview(pwdTextField)
        view.addSubview(pwdThumbnail)
        view.addSubview(emailThumbnail)
        view.addSubview(containerView)
        view.addSubview(emailUnderLine)
        view.addSubview(pwdUnderLine)
        view.addGestureRecognizer(tap)
    }
    
    private func autoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        let layoutGuide = containerView.safeAreaLayoutGuide
        let loginSize: CGFloat = 40
        let margin: CGFloat = 50
        let padding: CGFloat = 20
        constraintContainerView = containerView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        constraintContainerView.isActive = true
        containerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        // 로그인 버튼
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: 0).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: padding).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -padding).isActive = true
        
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // 썸네일
        emailThumbnail.translatesAutoresizingMaskIntoConstraints = false
        emailThumbnail.bottomAnchor.constraint(equalTo: pwdThumbnail.topAnchor, constant: -margin).isActive = true
        emailThumbnail.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: padding).isActive = true
        emailThumbnail.trailingAnchor.constraint(equalTo: emailTextField.leadingAnchor, constant: -padding).isActive = true
        
        pwdThumbnail.translatesAutoresizingMaskIntoConstraints = false
        pwdThumbnail.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -margin).isActive = true
        pwdThumbnail.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: padding).isActive = true
        pwdThumbnail.trailingAnchor.constraint(equalTo: pwdTextField.leadingAnchor, constant: -padding).isActive = true
        
        // 이메일 TF
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.bottomAnchor.constraint(equalTo: emailUnderLine.topAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -padding).isActive = true
        
        emailUnderLine.translatesAutoresizingMaskIntoConstraints = false
        emailUnderLine.leadingAnchor.constraint(equalTo: emailThumbnail.trailingAnchor, constant: padding).isActive = true
        emailUnderLine.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -padding).isActive = true
        emailUnderLine.bottomAnchor.constraint(equalTo: pwdTextField.topAnchor, constant: -margin).isActive = true
        emailUnderLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        // 비밀번호 TF
        pwdTextField.translatesAutoresizingMaskIntoConstraints = false
        pwdTextField.bottomAnchor.constraint(equalTo: pwdUnderLine.topAnchor).isActive = true
        pwdTextField.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -padding).isActive = true
        pwdTextField.isSecureTextEntry = true
        
        pwdUnderLine.translatesAutoresizingMaskIntoConstraints = false
        pwdUnderLine.leadingAnchor.constraint(equalTo: pwdThumbnail.trailingAnchor, constant: padding).isActive = true
        pwdUnderLine.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -padding).isActive = true
        pwdUnderLine.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -margin).isActive = true
        pwdUnderLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // 썸네일 사이즈
        
        emailThumbnail.heightAnchor.constraint(equalToConstant: loginSize).isActive = true
        emailThumbnail.widthAnchor.constraint(equalToConstant: loginSize).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: loginSize).isActive = true
        
        pwdThumbnail.heightAnchor.constraint(equalToConstant: loginSize).isActive = true
        pwdThumbnail.widthAnchor.constraint(equalToConstant: loginSize).isActive = true
        pwdTextField.heightAnchor.constraint(equalToConstant: loginSize).isActive = true
        
    }
}
