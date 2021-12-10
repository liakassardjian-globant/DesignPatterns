//
//  OfficeComputerFactory.swift
//  Abstract
//
//  Created by Lia Kassardjian on 05/11/21.
//

import Foundation

class OfficeComputerFactory: ComputerFactory {
    override func chooseFinish() -> Finish? {
        return Silver()
    }
    
    override func chooseProcessor() -> Processor? {
        return Fast()
    }
    
    override func chooseGraphics() -> Graphics? {
        return Standard()
    }
}
