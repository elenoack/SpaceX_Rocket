//
//  RocketDataManager.swift
//  SpaceX_Rocket
//
//  Created by Даниил Смирнов on 17.06.2022.
//

import Foundation

class RocketModel {
    
    func createRocketData() -> [Rocket] {
        return [
            Rocket(
                image: ["1","2","3","4","5"],
                rocketName: "Falcon Heavy",
                height: Diameter(meters: 69.9,
                                 feet: 229.6),
                diameter: Diameter(meters: 12.1,
                                   feet: 39.9),
                mass: Mass(kg: 1417809,
                           lb: 3125735),
                payloadWeight: PayloadWeight(kg: 63802,
                                             lb: 140660),
                firstFlight: "7 февраля, 2018",
                country: "США",
                coastFirstFlight: "$90 млн",
                firstStage: FirstStage(engines: 27,
                                       fuelAmountTons: 308.6,
                                       burnTimeSEC: 593),
                secondStage: SecondStage(engines: 1,
                                         fuelAmountTons: 243.2,
                                         burnTimeSEC: 397),
                dataLaunching: [
                    LaunchData(rocketName: "FalconSat",
                               launchingDate: "2 февраля, 2022",
                               image: "ok"),
                    LaunchData(rocketName: "Heavy holidays",
                               launchingDate: "6 января, 2022",
                               image: "ok"),
                    LaunchData(rocketName: "CRS-24 Mission",
                               launchingDate: "23 декабря, 2021",
                               image: "fail")
                ]
            )
        ]
    }
}
