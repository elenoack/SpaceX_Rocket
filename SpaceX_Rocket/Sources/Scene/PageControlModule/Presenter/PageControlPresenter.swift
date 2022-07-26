//
//  PageControlPresenter.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 23.07.22.
//


import UIKit

protocol PageViewProtocol: AnyObject {
  func success(withNumber number: Int)
}

protocol PageControlPresenterProtocol: AnyObject {
    init(view: PageViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    var rockets: [RocketData]? { get set }
    func fetchRocketsData()
 
}

class PageControlPresenter: PageControlPresenterProtocol {
 
    let view: PageViewProtocol?
    let networkService: NetworkServiceProtocol?
    let router: RouterProtocol?
    var rockets: [RocketData]?
    
    required init(view: PageViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        fetchRocketsData()
    }
    
    
    func fetchRocketsData() {
        networkService?.fetchRocketsData { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case let .success(rocket):
                    self.rockets = rocket
                    self.view?.success(withNumber: self.rockets?.count ?? 0)
                case .failure(_): break
                }
                return
            }
        }
    }
    
    
    
}




