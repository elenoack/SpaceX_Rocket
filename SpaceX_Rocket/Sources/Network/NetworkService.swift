//
//  NetworkService.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 15.06.22.
//

import UIKit

struct Сonfiguration {
    
    static let baseURL = "https://api.spacexdata.com/v4/"
    static let rocketsEndPoint = "rockets"
    static let launchesEndPoint = "launches"
}

protocol NetworkServiceProtocol {
    
    func fetchRocketImage(with name: String, completion:  @escaping (Result<(UIImage?), NetworkError>) -> Void)
    func fetchRocketsData( completion: @escaping (Result<[Rocket], NetworkError>) -> Void)
    func fetchLaunchesData( completion: @escaping (Result<[LaunchData], NetworkError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func fetchRocketsData( completion: @escaping (Result<[Rocket], NetworkError>) -> Void) {
        getData(url: Сonfiguration.baseURL,
                endpoint:  Сonfiguration.rocketsEndPoint,
                completion: completion)
    }
    func fetchLaunchesData( completion: @escaping (Result<[LaunchData], NetworkError>) -> Void) {
        getData(url:  Сonfiguration.baseURL,
                endpoint:  Сonfiguration.launchesEndPoint,
                completion: completion)
    }
    
    func fetchRocketImage(with name: String, completion:  @escaping (Result<(UIImage?), NetworkError>) -> Void) {
        guard let url = URL(string: name) else {
            completion(.failure(.badURL))
            print(NetworkError.badURL.localizedDescription)
            return
        }
        
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    completion(.success(UIImage(data: data)))
                } else {
                    completion(.failure(.badJSON))
                    print(NetworkError.badJSON.localizedDescription)
                    return
                }
            }.resume()
        }
    }
}

// MARK: - Private

private extension NetworkService {
    
    func getData<T: Decodable>(url: String,
                               endpoint: String,
                               completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL.url(with: url, endpoint: endpoint) else {
            completion(.failure(.badURL))
            print(NetworkError.badURL.localizedDescription)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                completion(.failure(.serverError))
                print(NetworkError.serverError.localizedDescription)
                return
            }
            
            guard let data = data,
                  let model = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(.badJSON))
                print(NetworkError.badJSON.localizedDescription)
                return
            }
            completion(.success(model))
        }
        task.resume()
    }
}


