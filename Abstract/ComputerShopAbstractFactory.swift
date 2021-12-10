//
//  ComputerShopAbstractFactory.swift
//  Abstract
//
//  Created by Lia Kassardjian on 05/11/21.
//

import Foundation

enum ComputerType {
    case office
    case highEnd
}

class ComputerFactory {
    func chooseFinish() -> Finish? {
        return nil
    }
    
    func chooseProcessor() -> Processor? {
        return nil
    }
    
    func chooseGraphics() -> Graphics? {
        return nil
    }
    
    func createComputer() -> Computer? {
        guard let finish = chooseFinish(), let processor = chooseProcessor(), let graphics = chooseGraphics() else {
            return nil
        }
        
        return Computer(finish: finish, processor: processor, graphics: graphics)
    }
    
    final class func makeFactory(type: ComputerType) -> ComputerFactory {
        switch type {
        case .office:
            return OfficeComputerFactory()
        case .highEnd:
            return HighEndComputerFactory()
        }
    }
}

let officeComputer = ComputerFactory.makeFactory(type: .office).createComputer()
let highEndComputer = ComputerFactory.makeFactory(type: .highEnd).createComputer()
