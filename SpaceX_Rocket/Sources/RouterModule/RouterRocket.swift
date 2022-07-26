//
//  RouterModule.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 23.07.22.
//

import UIKit

protocol RouterRocket {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterRocket {
    func initViewController()
    func openLaunchVC(rocketId: String)
    func openSettingsVC()
    func backToRootVC()
    func backToRootVCModal()
    var saveCompletion: (() -> Void)? { get set }
}

class RouterModule: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    var saveCompletion: (() -> Void)?
    
    init(navigationController: UINavigationController,
         assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initViewController() {
        if let navigationController = navigationController {
            guard let pageViewController = assemblyBuilder?.createRocketInfoModule(router: self) else { return }
            navigationController.viewControllers = [pageViewController]
        }
    }
    
    func openLaunchVC(rocketId: String) {
        if let navigationController = navigationController {
            navigationController.navigationItem.backButtonTitle = "Назад"
            navigationController.title = "Имя"
            guard let launchListViewController = assemblyBuilder?.createLaunchListModule(router: self, rocketId: rocketId) else { return }
            navigationController.pushViewController(launchListViewController, animated: true)
          }
        }
    
        func openSettingsVC() {
            if let navigationController = navigationController {
                guard let settingsListViewController = assemblyBuilder?.createSettingModule(router: self) else { return }
                let navController = UINavigationController(rootViewController: settingsListViewController)
                navController.navigationBar.topItem?.title = "Настройки"
                navigationController.present(navController, animated: true)
            }
        }
    
    func backToRootVC() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    func backToRootVCModal() {
        if let navigationController = navigationController {
            navigationController.dismiss(animated: true, completion: saveCompletion)
        }
    }
    
}

