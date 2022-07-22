//
//  ModuleBuilder.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 22.07.22.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModuleBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        let model = RocketModel()
        let view = PageViewController()
        let presenter = MainPresenter(view: view, model: model)
        view.presenter = presenter
        return view
    }
}
    
    

