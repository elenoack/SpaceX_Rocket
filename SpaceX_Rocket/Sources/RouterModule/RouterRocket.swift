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
    func openLaunchVC(rocketId: String, viewController: UIViewController) 
    func openSettingsVC(viewController: UIViewController)
    func backToRootVC()
    func backToRootVCModal(viewController: UIViewController)
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
            guard let pageViewController = assemblyBuilder?.createPageControlRocketModule(router: self) else { return }
            navigationController.viewControllers = [pageViewController]
        }
    }
    
    func openLaunchVC(rocketId: String, viewController: UIViewController) {
  
            guard let pageViewController = assemblyBuilder?.createPageControlRocketModule(router: self) else { return }
            guard let launchListViewController = assemblyBuilder?.createLaunchListModule(router: self, rocketId: rocketId) else { return }
            pageViewController.navigationController?.viewControllers = [viewController]
            viewController.navigationController?.pushViewController(launchListViewController, animated: true)
    }
    
    func openSettingsVC(viewController: UIViewController) {
            guard let settingsListViewController = assemblyBuilder?.createSettingModule(router: self) else { return }
            let navController = UINavigationController(rootViewController: settingsListViewController)
            navController.navigationBar.topItem?.title = "Настройки"
            viewController.navigationController?.present(navController, animated: true)
    }
    
    func backToRootVC() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    func backToRootVCModal(viewController: UIViewController) {
        viewController.navigationController?.dismiss(animated: true, completion: saveCompletion)
    }
}

