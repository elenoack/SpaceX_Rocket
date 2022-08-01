//
//  RocketInfoViewController+Extension.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 25.07.22.
//

import UIKit


extension RocketInfoViewController {
    // MARK: - Constants
    
    enum Metric {
        static let tableViewHeaderHeight: CGFloat = 50
        static let tableViewHeight: CGFloat = 52
    }
    
    enum Strings {
        static let heightParameterMeter: String = "Высота, m"
        static let heightParameterFeet: String = "Высота, ft"
        static let diameterParameterMeter: String = "Диаметр, m"
        static let diameterParameterFeet: String = "Диаметр, ft"
        static let massParameterKg: String = "Масса, kg"
        static let massParameterLb: String = "Масса, lb"
        static let payloadParameterKg: String = "Нагрузка, kg"
        static let payloadParameterLb: String = "Нагрузка, lb"
        static let firstLaunch: String = "Первый запуск"
        static let country: String = "Страна"
        static let coastLaunch: String = "Cтоимость запуска"
        static let million: String = " млн"
        static let numberOfEngines: String = "Количество двигателей"
        static let whitespace: String = "   "
        static let fuelAmount: String = "Количество топлива"
        static let tons: String = "ton"
        static let burnTime: String = "Время сгорания"
        static let seconds: String = "sec"
        static let firstStage: String = "Первая ступень"
        static let secondStage: String = "Вторая ступень"
        static let errorAlertTitle: String = "Что-то пошло не так..."
        static let alertActionTitle: String = "OK"
        static let fatalError: String = "init(coder:) has not been implemented"
        static let rocketImage: String = "rocket"
    }
}


