//
//  Rocket.swift
//  SpaceX_Rocket
//
//  Created by Даниил Смирнов on 17.06.2022.
//

import Foundation
// MARK: - Rocket

//  ничего не трогать! + распарсить JSON для запусков. имена делать короче 

struct Rocket: Decodable {
    
    let rocketName: String
    let image: [String]
    let id: String
    let height: Length
    let diameter: Length
    let mass: Mass
    let payload: [Payload]
    let country: String = "США"
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
        case id, height, diameter, mass
//        case id, height, diameter, mass, country, case, secondStage
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

//MARK: - LaunchData

struct LaunchData: Decodable {
    let rocketName: String
    let launchingDate: String
    let image: String
}



 
