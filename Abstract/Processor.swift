//
//  Processor.swift
//  DesignPatterns
//
//  Created by Lia Kassardjian on 05/11/21.
//

import Foundation

protocol Processor: CustomStringConvertible {
    var type: String { get }
    var price: Int { get }
}

extension Processor {
    var description: String {
        return type
    }
}

struct Fast: Processor {
    let type: String = "fast"
    let price: Int = 300
    
    init() {}
}

struct Turbo: Processor {
    let type: String = "turbo"
    let price: Int = 500
    
    init() {}
}
