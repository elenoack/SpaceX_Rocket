//
//  PageControlPresenter.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 23.07.22.
//


import UIKit

protocol PageViewProtocol: AnyObject {
  
}

protocol PageControlPresenterProtocol: AnyObject {
    init(view: PageViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
}

class PageControlPresenter: PageControlPresenterProtocol {
 
    let view: PageViewProtocol?
    let networkService: NetworkServiceProtocol?
    let router: RouterProtocol?
    
    required init(view: PageViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
}




