//
//  Computer.swift
//  Abstract
//
//  Created by Lia Kassardjian on 05/11/21.
//

import Foundation

struct Computer: CustomStringConvertible {
    var finish: Finish
    var processor: Processor
    var graphics: Graphics
    
    var price: Int {
        return finish.price + processor.price + graphics.price
    }
    
    var description: String {
        return "\nYour configuration:\n\tFinish: \(finish)\n\tProcessor: \(processor)\n\tGraphics: \(graphics)\n\t$\(price)"
    }
}
