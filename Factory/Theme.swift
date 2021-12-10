//
//  Theme.swift
//  DesignPatterns
//
//  Created by Lia Kassardjian on 05/11/21.
//

import UIKit

public protocol Theme {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}

public struct LightTheme: Theme {
    public var backgroundColor: UIColor = .white
    public var textColor: UIColor = .black
}

public struct DarkTheme: Theme {
    public var backgroundColor: UIColor = .black
    public var textColor: UIColor = .white
}

public struct BrownTheme: Theme {
    public var backgroundColor: UIColor = .brown
    public var textColor: UIColor = .white
}


