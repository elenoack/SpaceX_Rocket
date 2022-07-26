//
//  LaunchData.swift
//  SpaceX_Rocket
//
//  Created by Даниил Смирнов on 26.07.2022.
//

import Foundation

struct LaunchData: Decodable {
    let rocket: Rocket
    let name: String
    let date_local: String
    var success: Bool?
    
    var firstLaunchData: String {
        reformat(inputDate: date_local)
    }
    
    private func reformat(inputDate: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        if let date = inputFormatter.date(from: inputDate) {
            let outputFormatter = DateFormatter()
            outputFormatter.locale = Locale(identifier: "ru_RU")
            outputFormatter.setLocalizedDateFormatFromTemplate("MMM d, yyyy")
            let outputDate = outputFormatter.string(from: date)
            return outputDate
        } else {
            return inputDate
        }
    }
    
}

enum Rocket: String, Codable {
    case the5E9D0D95Eda69955F709D1Eb = "5e9d0d95eda69955f709d1eb"
    case the5E9D0D95Eda69973A809D1Ec = "5e9d0d95eda69973a809d1ec"
    case the5E9D0D95Eda69974Db09D1Ed = "5e9d0d95eda69974db09d1ed"
}
