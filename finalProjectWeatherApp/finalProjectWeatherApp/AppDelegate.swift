//
//  AppDelegate.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 02/03/2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let tabBar = TabBarController()
            window.rootViewController = tabBar
            window.makeKeyAndVisible()
        }
        return true
    }
}
