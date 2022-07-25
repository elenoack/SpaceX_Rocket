//
//  RocketInfoPresenter.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 17.06.22.
//

import UIKit

protocol RocketViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol RocketInfoPresenterProtocol: AnyObject {
    init(view: RocketViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func tapLaunchesButton()
    func tapSettingButton()
    var rockets: [Rocket]? { get set }
    var rocketsImage: UIImage { get set }
    func reload() 
}

class RocketInfoPresenter: RocketInfoPresenterProtocol {

    let view: RocketViewProtocol?
    let networkService: NetworkServiceProtocol?
    var router: RouterProtocol?
    var rockets: [Rocket]?
    var rocketsImage = UIImage()
    let defaults = UserDefaultsStorage()
    
    required init(view: RocketViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        fetchRocketsData()
        fetchRocketsImage()
    }
    
    func tapLaunchesButton() {
        router?.openLaunchVC()
    }
    
    func tapSettingButton() {
        router?.openSettingsVC()
    }
    
    func fetchRocketsData() {
        networkService?.fetchRocketsData { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case let .success(Rocket):
                    self.rockets = Rocket
                    self.view?.success()
                case let .failure(error):
                    self.view?.failure(error: error)
                }
                return
            }
        }
    }
    
    func fetchRocketsImage() {
        guard let rocketImage = rockets?.first?.image.first else { return }
        networkService?.fetchRocketImage(with: rocketImage, completion: { [weak self] image in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.rocketsImage = image ?? UIImage()
            }
        })
    }
    
    func reload() {
        router?.saveCompletion = {
            self.view?.success()
           }
    }
}



