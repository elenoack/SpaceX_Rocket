//
//  UserDefaultKey..swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 24.06.22.
//

import Foundation

struct UserDefaultKey: RawRepresentable {
    let rawValue: String
}

extension UserDefaultKey: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        rawValue = value
    }
}
