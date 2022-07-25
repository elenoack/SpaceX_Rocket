//
//  SettingsPresenter.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 23.07.22.
//

import UIKit

protocol SettingsViewProtocol: AnyObject {

}

protocol SettingsPresenterProtocol: AnyObject {
    init(view: SettingsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func tapBackButton()
}

class SettingsPresenter: SettingsPresenterProtocol {
    
    let view: SettingsViewProtocol?
    let networkService: NetworkServiceProtocol?
    let router: RouterProtocol?
    
    required init(view: SettingsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    func tapBackButton() {
        router?.backToRootVCModal()
    }
}





