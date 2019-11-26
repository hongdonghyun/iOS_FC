//
//  AppDelegate.swift
//  HelloWorld
//
//  Created by Hongdonghyun on 2019/11/21.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit


/*
 
 SceneDelegate 사용할 때
 iOS 13 미만
 -> 현업 OR 개인앱
  - @available(iOS <버전>, *) 명시
  - AppDelegate에 window 프로퍼티 추가
 
 iOS 13 이상 + SceneDelegate 사용 기준 (공부할 떄)
  -> AppDelegate랑 SceneDelegate 무시
   - 코드 주석 처리
 
 SceneDelegate 사용하지 않을 때 (AppDelegate Only)
 - SceneDelegate.swift 삭제
 - AppDelegate에서 Sence관련 method 삭제
 - Info.plist에서 Application Scene Manifast 삭제
 
 Xcode10 - AppDelegate.swift 가 기본
 Xcode11이상 - ScenceDelegate.swift 가 기본
 */

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // 기본바탕
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 초기화 작업이 일어나는곳
        print("didFinishLaunchingWithOptions")
        return true
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Active
        print("applicationDidBecomeActive")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // InActive
        print("applicationWillResignActive")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // BackGround
        print("applicationDidEnterBackground")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("applicationWillEnterForeground")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Kill
        print("applicationWillTerminate")
    }
    
    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

