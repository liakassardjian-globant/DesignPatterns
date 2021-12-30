//
//  Example.swift
//  Flyweight
//
//  Created by Lia Kassardjian on 30/12/21.
//

import Foundation

fileprivate class Example {
    func example() {
        let fleetSize = 1000
        var ships = [SpaceShip]()
        let vertices = [Float](repeating: 0, count: 1000) // dummy array of floats
        
        let sharedState = SharedSpaceShipData(mesh: vertices, imageNamed: "SpaceShip")
        
        for _ in 0..<fleetSize {
            let ship = SpaceShip(sharedData: sharedState,
                                 position: (Float.random(in: 1...100),
                                            Float.random(in: 1...100),
                                            Float.random(in: 1...100)))
            ships.append(ship)
        }
    }
}
