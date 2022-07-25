//
//  NetworkError.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 15.06.22.
//

import Foundation

//  ПОТОМ ДОДЕЛАЮ, убрать то, что не нужно и проверить норм ли все

enum NetworkError: Error, LocalizedError {
    
    case badURL
    case badJSON
    case notFound
    case noInternet
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Bad URL"
        case .badJSON:
            return "Can't load data"
        case .notFound:
            return ""
        case .noInternet:
            return "Please check your internet connection and try again"
        }
    }
    
}

