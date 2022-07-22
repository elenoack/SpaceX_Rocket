//
//  Rocket.swift
//  SpaceX_Rocket
//
//  Created by Даниил Смирнов on 17.06.2022.
//

import Foundation

//MARK: - Rocket
struct Rocket {
    let image: [String]
    let rocketName: String
    let height: Diameter
    let diameter: Diameter
    let mass: Mass
    let payloadWeight: PayloadWeight
    let firstFlight: String
    let country: String
    let coastFirstFlight: String
    let firstStage: FirstStage
    let secondStage: SecondStage
    let dataLaunching: [LaunchData]
}

//MARK: - Diameter
struct Diameter {
    let meters, feet: Double
}

//MARK: - Mass
struct Mass {
    let kg, lb: Int
}

//MARK: - PayloadWeight
struct PayloadWeight {
    let kg, lb: Int
}

//MARK: - FirstStage
struct FirstStage {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int
}

//MARK: - SecondStage
struct SecondStage {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int
}

//MARK: - LaunchData
struct LaunchData {
    let rocketName: String
    let launchingDate: String
    let image: String
}
