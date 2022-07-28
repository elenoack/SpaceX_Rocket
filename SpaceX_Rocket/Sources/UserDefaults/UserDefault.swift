//
//  UserDefault.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 24.06.22.
//

import Foundation


@propertyWrapper
struct UnitsHeightUserDefault<T: PropertyListValue> {
    private let key: UserDefaultKey
    private let defaultValue: T
    
    init(key: UserDefaultKey, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get { UserDefaults.standard.value(forKey: key.rawValue) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key.rawValue) }
    }
}

@propertyWrapper
struct UnitsMassUserDefault<T: PropertyListValue> {
    private let key: UserDefaultKey
    private let defaultValue: T
    
    init(key: UserDefaultKey, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get { UserDefaults.standard.value(forKey: key.rawValue) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key.rawValue) }
    }
}

@propertyWrapper
struct UnitsDiameterUserDefault<T: PropertyListValue> {
    private let key: UserDefaultKey
    private let defaultValue: T
    
    init(key: UserDefaultKey, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get { UserDefaults.standard.value(forKey: key.rawValue) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key.rawValue) }
    }
}

@propertyWrapper
struct UnitsPayloadUserDefault<T: PropertyListValue> {
    private let key: UserDefaultKey
    private let defaultValue: T
    
    init(key: UserDefaultKey, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get { UserDefaults.standard.value(forKey: key.rawValue) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key.rawValue) }
    }
}
