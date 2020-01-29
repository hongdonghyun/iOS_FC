//
//  AppDelegate.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/20.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 13.0, *) { }
            else {
                let window = UIWindow(frame: UIScreen.main.bounds)
                window.backgroundColor = .white
                
                let tabBar = UITabBarController()
                let main = UINavigationController(rootViewController: ViewController())
                let recent = UINavigationController(rootViewController: RecentViewController())
//                let receipt = UINavigationController(rootViewController: ReceiptViewController())
                main.tabBarItem = UITabBarItem(title: "계산", image: nil, tag: 0)
                recent.tabBarItem = UITabBarItem(title: "최근 목록", image: nil, tag: 1)
//                receipt.tabBarItem = UITabBarItem(title: "영수증", image: nil, tag: 2)
                tabBar.viewControllers = [main, recent]
                self.window = window
                window.rootViewController = tabBar
                window.makeKeyAndVisible()

            }
            
            return true
        }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

