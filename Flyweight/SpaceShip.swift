//
//  SpaceShip.swift
//  Flyweight
//
//  Created by Lia Kassardjian on 30/12/21.
//

import Foundation
import UIKit

class SpaceShip {
///   Mesh and texture are part of the intrinsic state of the space ship and can be shared among multiple objects
//    private let mesh: [Float]
//    private let texture: UIImage?
    
    private var intrinsicState: SharedSpaceShipData
    private var position: (Float, Float, Float)
    
    init(/* mesh: [Float], imageNamed name: String,*/ sharedData: SharedSpaceShipData, position: (Float, Float, Float) = (0, 0, 0)) {
//        self.mesh = mesh
//        self.texture = UIImage(named: name)
        self.intrinsicState = sharedData
        self.position = position
    }
}
