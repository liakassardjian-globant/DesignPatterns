//
//  Director.swift
//  DesignPatterns
//
//  Created by Lia Kassardjian on 17/08/21.
//

import Foundation

class Director {
    private var builder: LaptopBuilder?
    
    init(builder: LaptopBuilder?) {
        self.builder = builder
    }
    
    public func constructLaptop(configuration: [String: String]) {
        builder?.buildParts(configuration: configuration)
    }
}

// MARK: - Usage example
extension Director {
    static func createBuilder(configuration: [String: String]) -> LaptopBuilder? {
        guard let model = configuration["base_model"] else {
            return nil
        }
        
        var laptopBuilder: LaptopBuilder?
        
        switch model {
        case "bugdet":
            laptopBuilder = BudgetLaptopBuilder()
        case "office":
            laptopBuilder = OfficeLaptopBuilder()
        case "high-end":
            laptopBuilder = HighEndLaptopBuilder()
        default:
            print("Unexpected value.")
            return nil
        }
        
        return laptopBuilder
    }
    
    static func start() {
        let configuration = ["base_model": "budget"]
        let laptopBuilder = createBuilder(configuration: configuration)
        let director = Director(builder: laptopBuilder)
        director.constructLaptop(configuration: configuration)
        
        if let laptop = laptopBuilder?.getLaptop() {
            print(laptop)
        }
    }
}
