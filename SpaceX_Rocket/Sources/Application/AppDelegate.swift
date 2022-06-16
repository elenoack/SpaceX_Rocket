//
//  AppDelegate.swift
//  SpaceX_Rocket
//
//  Created by mac on 15.06.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = LaunchListViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

