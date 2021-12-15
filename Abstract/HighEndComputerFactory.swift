//
//  HighEndComputerFactory.swift
//  Abstract
//
//  Created by Lia Kassardjian on 05/11/21.
//

import Foundation

/// Concrete computer factory
class HighEndComputerFactory: ComputerFactory {
    override func chooseFinish() -> Finish? {
        return SpaceGray()
    }
    
    override func chooseProcessor() -> Processor? {
        return Turbo()
    }
    
    override func chooseGraphics() -> Graphics? {
        return Ultra()
    }
}
