//
//  ViewController.swift
//  URLScheme
//
//  Created by giftbot on 2020. 1. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBAction private func openSetting(_ sender: Any) {
        print("\n---------- [ openSettingApp ] ----------\n")
        // 설정앱 URL
        guard let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
        
    }
    
    @IBAction private func openMail(_ sender: Any) {
        print("\n---------- [ openMail ] ----------\n")
        let scheme = "mailto:hong3@kakao.com"
//        "mailto:hong3@kakao.com,hong3@kakao.com,hong3@kakao.com"
        guard let url = URL(string: scheme),
            UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
        
    }
    
    @IBAction private func openMessage(_ sender: Any) {
        print("\n---------- [ openMessage ] ----------\n")
        let url = URL(string: "sms:010-9296-4367&body=asd")!
        guard UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
        
    }
    
    @IBAction private func openWebsite(_ sender: Any) {
        print("\n---------- [ openWebsite ] ----------\n")
        let url = URL(string: "http://www.naver.com")!
        guard UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
        
    }
    
    @IBAction private func openFacebook(_ sender: Any) {
        print("\n---------- [ openFacebook ] ----------\n")
    }
    
    @IBAction private func openMyApp(_ sender: Any) {
        print("\n---------- [ openMyApp ] ----------\n")
        let url = URL(string: "myApp://host?name=abc&age=10")!
        guard UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
    }
}




