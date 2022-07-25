//
//  URL+Extensions.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 15.06.22.
//

import Foundation

extension URL {
    
    static func url(with path: String,
                    endpoint: String) -> URL? {
        guard let url = URL(string: path)?.appendingPathComponent(endpoint),
              let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        return urlComponents.url
    }
    
}
