//
//  UserDefaultsStorage.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 24.06.22.
//

import Foundation


class UserDefaultsStorage {
    @UnitsHeightUserDefault(key: .unitsHeight, defaultValue: 0)
    var unitsHeight: Int
    @UnitsDiameterUserDefault(key: .unitsDiameter, defaultValue: 0)
    var unitsDiameter: Int
    @UnitsMassUserDefault(key: .unitsMass, defaultValue: 0)
    var unitsMass: Int
    @UnitsPayloadUserDefault(key: .unitsPayload, defaultValue: 0)
    var unitsPayload: Int
}

private extension UserDefaultKey {
    static let unitsHeight: UserDefaultKey = "unitsHeight"
    static let unitsDiameter: UserDefaultKey = "unitsDiameter"
    static let unitsMass: UserDefaultKey = "unitsMass"
    static let unitsPayload: UserDefaultKey = "unitsPayload"
}

