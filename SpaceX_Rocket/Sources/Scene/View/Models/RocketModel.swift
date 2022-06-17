//
//  RocketModel.swift
//  SpaceX_Rocket
//
//  Created by Даниил Смирнов on 17.06.2022.
//

import Foundation

struct RocketModel {
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
 
struct Diameter {
    let meters, feet: Double
}

struct Mass {
    let kg, lb: Int
}

struct PayloadWeight {
    let kg, lb: Int
}

struct FirstStage {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int
}

struct SecondStage {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int
}

struct LaunchData {
    let rocketName: String
    let launchingDate: String
    let image: String
}
