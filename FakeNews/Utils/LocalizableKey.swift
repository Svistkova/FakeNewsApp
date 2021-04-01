//
//  LocalizableKey.swift
//  FakeNews
//
//  Created by Marina Svistkova on 29.03.2021.
//

import Foundation

enum LocalizableKey {
    enum General: String {
        case generalTitle = "general_title_text"
    }

    enum SingleNewsScreen: String {
        case dismissButton = "dismiss_button_title"
    }
}

extension RawRepresentable where RawValue == String {
    func localized() -> String {
        return rawValue.localized()
    }
}

extension String {

    public func localized() -> String {
        return self.localized(bundle: Bundle.main)
    }

    public func localized(bundle: Bundle) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
