//
//  LaunchListPresenter.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 23.07.22.
//

import UIKit

protocol LaunchViewProtocol: AnyObject {
    
}

protocol LaunchListPresenterProtocol: AnyObject {
    init(view: LaunchViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func tapBackBarButton()
}

class LaunchListPresenter: LaunchListPresenterProtocol {
    
    let view: LaunchViewProtocol?
    let networkService: NetworkServiceProtocol?
    let router: RouterProtocol?
    
    required init(view: LaunchViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    func tapBackBarButton() {
        router?.backToRootVC()
    }
}




