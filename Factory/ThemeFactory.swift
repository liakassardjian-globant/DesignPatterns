//
//  ThemeFactory.swift
//  DesignPatterns
//
//  Created by Lia Kassardjian on 05/11/21.
//

import Foundation

public enum Themes {
    case light
    case dark
    case brown
}

public struct ThemeFactory {
    public static func makeTheme(_ type: Themes) -> Theme {
        switch type {
        case .light:
            return LightTheme()
        case .dark:
            return DarkTheme()
        case .brown:
            return BrownTheme()
        }
    }
}
