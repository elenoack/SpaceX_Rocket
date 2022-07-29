//
//  AssemblyModuleBuilder.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 22.07.22.
//

import UIKit
// MARK: - AssemblyBuilderProtocol

protocol AssemblyBuilderProtocol {
    func createPageControlRocketModule(router: RouterModule) -> UIViewController
    func createRocketInfoModule(router: RouterModule,
                                with serialNumber: Int) -> UIViewController
    func createLaunchListModule(router: RouterModule,
                                rocketId: String,
                                rocketName: String) -> UIViewController
    func createSettingModule(router: RouterModule) -> UIViewController
}

// MARK: - AssemblyModuleBuilder

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
    
    func createRocketInfoModule(router: RouterModule, with serialNumber: Int) -> UIViewController {
        let networkService = NetworkService()
        let view = RocketInfoViewController(serialNumber: serialNumber)
        let presenter = RocketInfoPresenter(view: view,
                                            networkService: networkService,
                                            router: router)
        view.presenter = presenter
        return view
    }

    func createLaunchListModule(router: RouterModule,
                                rocketId: String,
                                rocketName: String) -> UIViewController {
        let networkService = NetworkService()
        let view = LaunchListViewController()
  
        let presenter = LaunchListPresenter(view: view,
                                            networkService: networkService,
                                            router: router,
                                            rocketId: rocketId,
                                            rocketName: rocketName)
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
    

