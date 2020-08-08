//
//  String+Extension.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created by Admin on 8/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

extension String {
    
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
}

extension String {
    
    func localized(with variable: CVarArg, comment: String = "") -> String {
        return String(format: localized(comment: comment), [variable])
    }
    
}

extension String {
    
    func localized(lang: String, tableName: String = "Localizable") -> String {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj") ?? ""
        if let bundle = Bundle(path: path) {
            return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "**\(self)**", comment: "")
        } else {
            return ""
        }
    }
    
}

extension String {
    
    func localized(tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
    
}
