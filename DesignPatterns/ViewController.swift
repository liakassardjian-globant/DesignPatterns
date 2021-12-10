//
//  ViewController.swift
//  DesignPatterns
//
//  Created by Lia Kassardjian on 10/08/21.
//

import UIKit
import Factory

class ViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Hello Swift"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let theme = ThemeFactory.makeTheme(.light) // .dark || .brown
        label.backgroundColor = theme.backgroundColor
        label.textColor = theme.textColor
    }
}

