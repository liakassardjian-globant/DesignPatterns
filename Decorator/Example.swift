//
//  Example.swift
//  Decorator
//
//  Created by Lia Kassardjian on 29/12/21.
//

import UIKit

/// Application example
fileprivate class Example {
    func example() {
        let roundedLabel = BorderedLabelDecorator(label: UILabel(), cornerRadius: 10, borderWidth: 1, borderColor: .red)
        roundedLabel.textAlignment = .center
        roundedLabel.backgroundColor = .white
        roundedLabel.textColor = .blue
        roundedLabel.text = "Rounded label with border and custom text"
    }
}
