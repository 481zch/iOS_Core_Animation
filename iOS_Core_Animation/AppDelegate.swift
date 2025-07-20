//
//  AppDelegate.swift
//  iOS_Core_Animation
//
//  Created by zangconghui on 2025/7/2.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = C5ViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

