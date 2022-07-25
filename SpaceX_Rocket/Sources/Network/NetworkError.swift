//
//  NetworkError.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 15.06.22.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    
    case badURL
    case badJSON
    case serverError
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Невалидный URL-адрес"
        case .badJSON:
            return "Не удается загрузить данные"
        case .serverError:
            return "Сервер не отвечает. Повторите попытку позже"
        }
    }
}

