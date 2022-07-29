//
//  PropertyListValue.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 24.06.22.
//

import Foundation


protocol PropertyListValue {}
extension String: PropertyListValue {}
extension Data: PropertyListValue {}
extension Date: PropertyListValue {}
extension Bool: PropertyListValue {}
extension Int: PropertyListValue {}
extension Double: PropertyListValue {}
extension Float: PropertyListValue {}
extension Array: PropertyListValue where Element: PropertyListValue {}
extension Dictionary: PropertyListValue where Key == String, Value: PropertyListValue {}
