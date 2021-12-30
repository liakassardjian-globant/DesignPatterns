//
//  SharedSpaceShipData.swift
//  Flyweight
//
//  Created by Lia Kassardjian on 30/12/21.
//

import Foundation
import UIKit

/// Shared Data: needs to be a reference type, so that the same instance can be shared for different instances
class SharedSpaceShipData {
    private let mesh: [Float]
    private let texture: UIImage?
    
    init(mesh: [Float], imageNamed name: String) {
        self.mesh = mesh
        self.texture = UIImage(named: name)
    }
}
