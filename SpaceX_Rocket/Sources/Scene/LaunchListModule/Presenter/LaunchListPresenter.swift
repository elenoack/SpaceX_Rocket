//
//  LaunchListPresenter.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 23.07.22.
//

import UIKit
// MARK: - LaunchViewProtocol

protocol LaunchViewProtocol: AnyObject {
    func success()
    func successNil()
    func failure(error: NetworkError)
}

// MARK: - LaunchListPresenterProtocol

protocol LaunchListPresenterProtocol: AnyObject {
    init(view: LaunchViewProtocol,
         networkService: NetworkServiceProtocol,
         router: RouterProtocol,
         rocketId: String,
         rocketName: String)
    func tapBackBarButton(viewController: UIViewController)
    var launches: [LaunchData]? { get set }
    var rocketId: String { get }
    var rocketName: String { get }
    func fetchLaunchesData()
}

// MARK: - LaunchListPresenter

class LaunchListPresenter: LaunchListPresenterProtocol {
    // MARK: - Properties
    
    let view: LaunchViewProtocol?
    let networkService: NetworkServiceProtocol?
    let router: RouterProtocol?
    let rocketId: String
    var rocketName: String
    var launches: [LaunchData]?
    
    // MARK: - Initialization
    
    required init(view: LaunchViewProtocol,
                  networkService: NetworkServiceProtocol,
                  router: RouterProtocol,
                  rocketId: String,
                  rocketName: String) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.rocketId = rocketId
        self.rocketName = rocketName
        fetchLaunchesData()
    }
    
    // MARK: - Private
    
    func tapBackBarButton(viewController: UIViewController) {
        router?.backToRootVC(viewController: viewController)
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
                    if self.launches?.count == 0 {
                        self.view?.successNil()
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




