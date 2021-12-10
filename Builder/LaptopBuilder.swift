//
//  LaptopBuilder.swift
//  DesignPatterns
//
//  Created by Lia Kassardjian on 17/08/21.
//

import Foundation

protocol LaptopBuilder {
    var size: Size { get set }
    var processor: Processor { get set }
    var graphics: Graphics { get set }
    
    mutating func buildParts(configuration: [String: String])
    func getLaptop() -> Laptop
}

extension LaptopBuilder {
    mutating public func buildParts(configuration: [String: String]) {
        if let customSize = configuration["size"] {
            switch customSize {
            case "13-inch":
                size = .thirteenInch
            case "15-inch":
                size = .fifteenInch
            default:
                break
            }
        }
        
        if let customProcessor = configuration["processor"] {
            switch customProcessor {
            case "i5":
                processor = .i5
            case "i7":
                processor = .i7
            case "i9":
                processor = .i9
            default:
                break
            }
        }
        
        if let customGraphics = configuration["graphics"] {
            switch customGraphics {
            case "intel-uhd-graphics-617":
                graphics = .intelUHD617
            case "intel-iris-plus-graphics-645":
                graphics = .intelIrisPlus645
            case "radeon-pro-vega-20":
                graphics = .radeonProVega20
            default:
                break
            }
        }
    }
    
    public func getLaptop() -> Laptop {
        return Laptop(size: self.size, processor: self.processor, graphics: self.graphics)
    }
}
