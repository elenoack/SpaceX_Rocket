//
//  AppDelegate.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 15.06.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let navigationController = UINavigationController()
    let assemblyBuilder = AssemblyModuleBuilder()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let router = RouterModule(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
        router.initViewController()
        navigationController.isNavigationBarHidden = true
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.tintColor = .white
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

