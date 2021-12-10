//
//  Laptop.swift
//  DesignPatterns
//
//  Created by Lia Kassardjian on 17/08/21.
//

import Foundation

class Laptop {
    var size: Size
    var processor: Processor
    var graphics: Graphics
    
    init(size: Size, processor: Processor, graphics: Graphics) {
        self.size = size
        self.processor = processor
        self.graphics = graphics
    }
}
