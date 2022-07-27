//
//  RocketData.swift
//  SpaceX_Rocket
//
//  Created by Даниил Смирнов on 26.07.2022.
//

import Foundation

struct RocketData: Decodable {
    
    let rocketName: String
    let image: [String]
    let id: String
    let height: Length
    let diameter: Length
    let mass: Mass
    let payload: [Payload]
    let country: String
    let coastLaunch: Int
    let firstStage: FirstStage
    let secondStage: SecondStage
    let firstFlight: String
    
    var firstFlightToPresent: String {
        reformat(inputDate: firstFlight)
    }
    
    private func reformat(inputDate: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: inputDate) {
            let outputFormatter = DateFormatter()
            outputFormatter.locale = Locale(identifier: "ru_RU")
            outputFormatter.setLocalizedDateFormatFromTemplate("MMMMddYYYY")
            let outputDate = outputFormatter.string(from: date)
            return outputDate
        } else {
            return inputDate
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id, height, diameter, mass, country
        case image = "flickr_images"
        case rocketName = "name"
        case payload = "payload_weights"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case coastLaunch = "cost_per_launch"
        case firstFlight = "first_flight"
    }
}

//MARK: - Mass

struct Length: Decodable {
    let meters, feet: Double
}

//MARK: - Mass

struct Mass: Decodable {
    let kg, lb: Int
}

//MARK: - Payload

struct Payload: Decodable {
    let kg, lb: Int
}

//MARK: - FirstStage

struct FirstStage: Decodable {
    let engines: Int
    let fuelAmount: Double
    let burnTime: Int?
    
    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmount = "fuel_amount_tons"
        case burnTime = "burn_time_sec"
    }
}

//MARK: - SecondStage

struct SecondStage: Decodable {
    let engines: Int
    let fuelAmount: Double
    let burnTime: Int?
    
    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmount = "fuel_amount_tons"
        case burnTime = "burn_time_sec"
    }
}

