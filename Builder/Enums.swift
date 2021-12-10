//
//  Enums.swift
//  DesignPatterns
//
//  Created by Lia Kassardjian on 17/08/21.
//

import Foundation

enum Size: String, CustomStringConvertible {
    case thirteenInch = "13-inch"
    case fifteenInch = "15-inch"
    
    public var description: String {
        return self.rawValue
    }
}

enum Processor: String, CustomStringConvertible {
    case i5 = "Intel Core i5"
    case i7 = "Intel Core i7"
    case i9 = "Intel Core i9"
    
    public var description: String {
        return self.rawValue
    }
}

enum Graphics: String, CustomStringConvertible {
    case intelUHD617 = "Intel UHD Graphics 617"
    case intelIrisPlus645 = "Intel Iris Plus Graphics 645"
    case radeonProVega20 = "Radeon Pro Vega 20"
    
    public var description: String {
        return self.rawValue
    }
}
