//
//  NetworkService.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 15.06.22.
//

import UIKit

protocol NetworkServiceProtocol {
    
    func fetchRocketsData( completion: @escaping (Result<[RocketData], NetworkError>) -> Void)
    func fetchLaunchesData( completion: @escaping (Result<[LaunchData], NetworkError>) -> Void)
    func fetchRocketImage(with name: String, completion: @escaping (UIImage?) -> Void)
}

class NetworkService: NetworkServiceProtocol {

    let baseURL = "https://api.spacexdata.com/v4/"
    let rocketsEndPoint = "rockets"
    let launchesEndPoint = "launches"
    
    func fetchRocketsData( completion: @escaping (Result<[RocketData], NetworkError>) -> Void) {
        getData(url: baseURL,
                endpoint: rocketsEndPoint,
                completion: completion)
    }
    
    func fetchLaunchesData( completion: @escaping (Result<[LaunchData], NetworkError>) -> Void) {
        getData(url: baseURL,
                endpoint: launchesEndPoint,
                completion: completion)
    }
    
    func fetchRocketImage(with name: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: name) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                completion(UIImage(data: data))
            } else {
                completion(nil)
            }
        }.resume()
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
                completion(.failure(.notFound))
                print(NetworkError.notFound.localizedDescription)
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


