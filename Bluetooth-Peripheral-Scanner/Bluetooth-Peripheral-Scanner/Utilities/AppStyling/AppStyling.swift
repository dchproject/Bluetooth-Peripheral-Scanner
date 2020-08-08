//
//  AppStyling.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created by Admin on 8/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

struct AppStyling {
    
    enum Font {
        case system
        case systemBold
        
        /// Default size is 14.0
        func font(ofSize size: CGFloat = 14.0) -> UIFont {
            switch self {
            case .system:
                return .systemFont(ofSize: size)
            case .systemBold:
                return .boldSystemFont(ofSize: size)
            }
        }
        
    }
    
    enum Color {
        case clear
        case systemWhite
        case systemBlack
        
        /// Default alpha is 1.0
        func color(alpha: CGFloat = 1.0) -> UIColor {
            switch self {
            case .clear:
                return .clear
            case .systemWhite:
                return UIColor.white.withAlphaComponent(alpha)
            case .systemBlack:
                return UIColor.black.withAlphaComponent(alpha)
            }
        }
        
    }
    
}
