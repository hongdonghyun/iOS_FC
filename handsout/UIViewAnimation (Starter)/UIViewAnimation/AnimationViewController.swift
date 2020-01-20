//
//  AnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2020. 1. 7..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class AnimationViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var userIdTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var countDownLabel: UILabel!
    
    @IBOutlet weak var testView: UIView!
    var count = 4 {
        didSet { countDownLabel.text = "\(count)" }
    }
    
    // MARK: - View LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicatorView.isHidden = true
        self.userIdTextField.center.x = -self.view.frame.width
        self.passwordTextField.center.x = -self.view.frame.width
        self.loginButton.center.x = -self.view.frame.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.6) {
            self.userIdTextField.center.x = self.userIdTextField.superview!.bounds.midX
        }
        UIView.animate(withDuration: 0.6, delay: 0.5, animations: {
            self.passwordTextField.center.x = self.passwordTextField.superview!.bounds.midX
        })
        // usingSpringWithDamping 흔들림
        // initialSpringVelocity 속도
        UIView.animate(withDuration: 0.6, delay: 1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0,
                       options: [], animations: {
                        self.loginButton.center.x = self.loginButton.superview!.bounds.midX
        })
    }
    
    // MARK: - Action Handler
    
    @IBAction private func didEndOnExit(_ sender: Any) {
    }
    
    @IBAction private func login(_ sender: Any) {
        view.endEditing(true)
        guard countDownLabel.isHidden else { return }
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        loginButtonAnimation()
        countDown()
        
    }
    
    func loginButtonAnimation() {
        let centerOrigin = loginButton.center
        UIView.animateKeyframes(
            withDuration: 1.6,
            delay: 0,
            animations: {
                // 대각선 아래
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                    self.loginButton.center.x += 50
                    self.loginButton.center.y += 20
                }
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                    self.loginButton.transform = CGAffineTransform(rotationAngle: .pi / 4 )
                    self.loginButton.center.x += 150
                    self.loginButton.center.y -= 70.0
                    self.loginButton.alpha = 0.0
                }
                UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01) {
                    self.loginButton.transform = .identity
                    self.loginButton.center = CGPoint(
                        x: centerOrigin.x,
                        y: self.loginButton.superview!.frame.height + 120
                    )
                }
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                    self.loginButton.alpha = 1.0
                    self.loginButton.center = centerOrigin
                }
                
        })
        activityIndicatorView.stopAnimating()
        activityIndicatorView.isHidden = true
    }
    
    func countDown() {
        countDownLabel.isHidden = false
        
        UIView.transition(
            with: self.countDownLabel,
            duration: 0.4,
            options: [.transitionCrossDissolve],
            animations: { self.count -= 1 },
            completion: { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    guard self.count == 0 else { return self.countDown() }
                    self.count = 4
                    self.countDownLabel.isHidden = true
                }
        }
        )
    }
}
