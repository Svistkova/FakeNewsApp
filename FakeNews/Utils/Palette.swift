//
//  Palette.swift
//  FakeNews
//
//  Created by Marina Svistkova on 01.04.2021.
//

import UIKit

public enum Palette: String {

    case blue
    case darkBlue
    case lightBlue
    case gray

    var color: UIColor {
        return UIColor(named: rawValue, in: Bundle.main, compatibleWith: nil) ?? UIColor.clear
    }

    var cgColor: CGColor {
        return color.cgColor
    }
}

public extension UIColor {

    static func palette(_ palette: Palette) -> UIColor {
        return palette.color
    }
}

public extension CGColor {

    static func palette(_ palette: Palette) -> CGColor {
        return palette.cgColor
    }
}
