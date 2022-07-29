//
//  SettingsPresenter.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 23.07.22.
//

import UIKit
// MARK: - SettingsViewProtocol

protocol SettingsViewProtocol: AnyObject {
    func download()
    func save()
}

// MARK: - SettingsPresenterProtocol

protocol SettingsPresenterProtocol: AnyObject {
    init(view: SettingsViewProtocol,
         networkService: NetworkServiceProtocol,
         router: RouterProtocol)
    func tapBackButton(viewController: UIViewController)
    func downloadSettings()
    func saveSettings()
}

// MARK: - SettingsPresenter

class SettingsPresenter: SettingsPresenterProtocol {
    // MARK: - Properties
    
    let view: SettingsViewProtocol?
    let networkService: NetworkServiceProtocol?
    let router: RouterProtocol?
    
    // MARK: - Initialization
    
    required init(view: SettingsViewProtocol,
                  networkService: NetworkServiceProtocol,
                  router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    func tapBackButton(viewController: UIViewController) {
        router?.backToRootVCModal(viewController: viewController)
    }
    
    func downloadSettings() {
        view?.download()
    }
    
    func saveSettings() {
        view?.save()
    }
}





