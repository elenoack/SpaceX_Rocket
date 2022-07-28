//
//  RouterModule.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 23.07.22.
//

import UIKit
// MARK: - RouterRocketProtocol

protocol RouterRocketProtocol {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

// MARK: - RouterProtocol

protocol RouterProtocol: RouterRocketProtocol {
    func initViewController()
    func openLaunchVC(rocketId: String,
                      viewController: UIViewController,
                      rocketName: String)
    func openSettingsVC(viewController: UIViewController)
    func backToRootVC(viewController: UIViewController)
    func backToRootVCModal(viewController: UIViewController)
    var saveCompletion: (() -> Void)? { get set }
}

class RouterModule: RouterProtocol {
    // MARK: - Properties
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    var saveCompletion: (() -> Void)?

    // MARK: - Initialization
    
    init(navigationController: UINavigationController,
         assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    // MARK: - Private
    
    func initViewController() {
        if let navigationController = navigationController {
            guard let pageViewController = assemblyBuilder?.createPageControlRocketModule(router: self)
            else { return }
            navigationController.viewControllers = [pageViewController]
        }
    }
    
    func openLaunchVC(rocketId: String, viewController: UIViewController, rocketName: String) {
        guard let launchListViewController = assemblyBuilder?.createLaunchListModule(router: self, rocketId: rocketId, rocketName: rocketName)
        else { return }
        viewController.navigationController?.pushViewController(launchListViewController, animated: true)
        let backButton = UIBarButtonItem()
        backButton.title = "Назад"
        launchListViewController.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func openSettingsVC(viewController: UIViewController) {
        guard let settingsListViewController = assemblyBuilder?.createSettingModule(router: self)
        else { return }
        let navController = UINavigationController(rootViewController: settingsListViewController)
        navController.navigationBar.topItem?.title = "Настройки"
        viewController.navigationController?.present(navController, animated: true)
    }
    
    func backToRootVC(viewController: UIViewController) {
        viewController.navigationController?.popToRootViewController(animated: true)
    }
    
    func backToRootVCModal(viewController: UIViewController) {
        viewController.navigationController?.dismiss(animated: true, completion: saveCompletion)
    }
}


