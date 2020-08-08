//
//  Localizable.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created by Admin on 8/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

protocol Localizable {
    var tableName: String { get }
    var localized: String { get }
}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    
    func localized(lang: AppLanguage) -> String {
        return rawValue.localized(lang: lang.rawValue)
    }
    
    var localized: String {
        return rawValue.localized(lang: AppLanguage.default.rawValue)
    }
    
}
