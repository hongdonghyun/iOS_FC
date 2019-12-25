//
//  LoginViewController.swift
//  TableViewPractice
//
//  Created by Hongdonghyun on 2019/12/25.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

struct UserInfo {
    static let isAuth = "false"
    static let userID = ""
    
}

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var pwdTextField: UITextField!
    
    let userID = "hong3@gmail.com"
    let userPWD = "112233"
    
    var isAuth: Bool {
        UserDefaults.standard.bool(forKey: UserInfo.isAuth)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isAuth {
            loadNextView()
        }
    }
    
    private func signIn(with ID: String) {
        UserDefaults.standard.set(true, forKey: UserInfo.isAuth)
        UserDefaults.standard.set(ID, forKey: UserInfo.userID)
        print("Login Success")
        print("Save ID: \(ID)")
        print("Save isAuth: \(UserDefaults.standard.bool(forKey: UserInfo.isAuth))")
        emailTextField.text?.removeAll()
        pwdTextField.text?.removeAll()
        loadNextView()
        
    }
    
    private func signInFailed() {
        print("login Failed")
        print(userID)
        print(userPWD)
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        guard let ID = emailTextField.text, let PWD = pwdTextField.text else { return }
        
        let textfieldRange = 4...16
        let userSatisfied = (
            textfieldRange ~= ID.count &&
                textfieldRange ~= PWD.count
        )
        let isAuthenticated = (userID == ID) && (userPWD == PWD)
        
        if isAuthenticated, userSatisfied {
            signIn(with: ID)
        } else {
            signInFailed()
        }
        
    }
    
    private func loadNextView() {
        
//        let VC = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        guard let navi = storyboard?.instantiateViewController(withIdentifier: "Navi"),
            let naviVC = navi as? UINavigationController
            else { return }
        naviVC.modalPresentationStyle = .fullScreen
        present(naviVC, animated: true)
    }
    
}
