//
//  LaunchListPresenter.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 23.07.22.
//

import UIKit

protocol LaunchViewProtocol: AnyObject {
    func success()
    func failure(error: NetworkError)
}

protocol LaunchListPresenterProtocol: AnyObject {
    init(view: LaunchViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, rocketId: String)
    func tapBackBarButton()
    var launches: [LaunchData]? { get set }
    var rocketId: String { get }
    func fetchLaunchesData()
}

class LaunchListPresenter: LaunchListPresenterProtocol {
    
    let view: LaunchViewProtocol?
    let networkService: NetworkServiceProtocol?
    let router: RouterProtocol?
    let rocketId: String
    var launches: [LaunchData]?
    
    required init(view: LaunchViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, rocketId: String) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.rocketId = rocketId
        fetchLaunchesData()
    }
    
    func tapBackBarButton() {
        router?.backToRootVC()
    }
    
    func fetchLaunchesData() {
        networkService?.fetchLaunchesData { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case let .success(LaunchData):
                    self.launches = LaunchData
                    self.launches = self.launches?.filter { data in
                        data.rocket.rawValue == self.rocketId
                    }
                    self.view?.success()
                case let .failure(error):
                    self.view?.failure(error: error)
                }
                return
            }
        }
    }
}




