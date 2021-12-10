//
//  Finish.swift
//  DesignPatterns
//
//  Created by Lia Kassardjian on 05/11/21.
//

import Foundation

protocol Finish: CustomStringConvertible {
    var color: String { get }
    var price: Int { get }
}

extension Finish {
    var description: String {
        return color
    }
}

struct Silver: Finish {
    let color: String = "silver"
    let price: Int = 200
    
    init() {}
}

struct SpaceGray: Finish {
    let color: String = "space gray"
    let price: Int = 300
    
    init() {}
}
