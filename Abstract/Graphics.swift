//
//  Graphics.swift
//  Abstract
//
//  Created by Lia Kassardjian on 05/11/21.
//

import Foundation

protocol Graphics: CustomStringConvertible {
    var card: String { get }
    var price: Int { get }
}

extension Graphics {
    var description: String {
        return card
    }
}

struct Standard: Graphics {
    let card: String = "standard"
    let price: Int = 400
    
    init() {}
}

struct Ultra: Graphics {
    let card: String = "ultra"
    let price: Int = 600
    
    init() {}
}
