//
//  UIColorExtension.swift
//  Decorator
//
//  Created by Lia Kassardjian on 15/12/21.
//

import UIKit

/// Enhancing ``UIColor`` via extension
extension UIColor {
    convenience init(hex: UInt32) {
        let divisor = CGFloat(255)
        let red = CGFloat((hex & 0xFF0000) >> 16) / divisor
        let green = CGFloat((hex & 0x00FF00) >> 8) / divisor
        let blue = CGFloat(hex & 0x0000FF) / divisor
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}

let darkBlue = UIColor(hex: 0x191970)
let lightBlue = UIColor(hex: 0x3CB5B5)
let customYellow = UIColor(hex: 0xFCD920)
let customRed = UIColor(hex: 0xE53B51)


