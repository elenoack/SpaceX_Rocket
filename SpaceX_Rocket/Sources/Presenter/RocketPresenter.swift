//
//  RocketPresenter.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 17.06.22.
//

import UIKit


protocol MainViewProtocol: AnyObject {
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, model: RocketModel)
}

class MainPresenter: MainViewPresenterProtocol {
    
    let view: MainViewProtocol
    let model: RocketModel
    
    required init(view: MainViewProtocol, model: RocketModel) {
        self.view = view
        self.model =  model
    }
}


