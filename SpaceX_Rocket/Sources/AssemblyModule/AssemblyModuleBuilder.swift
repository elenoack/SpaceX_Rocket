//
//  AssemblyModuleBuilder.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 22.07.22.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createPageControlRocketModule(router: RouterModule) -> UIViewController
    func createRocketInfoModule(router: RouterModule) -> UIViewController
    func createLaunchListModule(router: RouterModule) -> UIViewController
    func createSettingModule(router: RouterModule) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
  
    func createPageControlRocketModule(router: RouterModule) -> UIViewController {
        let networkService = NetworkService()
        let view = PageViewController(transitionStyle: .scroll,
                                      navigationOrientation: .horizontal,
                                      options: nil)
        let presenter = PageControlPresenter(view: view,
                                             networkService: networkService,
                                             router: router)
        view.presenter = presenter
        return view
    }
    
    func createRocketInfoModule(router: RouterModule) -> UIViewController {
        let networkService = NetworkService()
        let view = RocketInfoViewController()
        let presenter = RocketInfoPresenter(view: view,
                                            networkService: networkService,
                                            router: router)
        view.presenter = presenter
        return view
    }

    func createLaunchListModule(router: RouterModule) -> UIViewController {
        let networkService = NetworkService()
        let view = LaunchListViewController()
        let presenter = LaunchListPresenter(view: view,
                                            networkService: networkService,
                                            router: router)
        view.presenter = presenter
        return view
    }
    
    func createSettingModule(router: RouterModule) -> UIViewController {
        let networkService = NetworkService()
        let view = SettingsViewController()
        let presenter = SettingsPresenter(view: view,
                                          networkService: networkService,
                                          router: router)
        view.presenter = presenter
        return view
    }
}
    

