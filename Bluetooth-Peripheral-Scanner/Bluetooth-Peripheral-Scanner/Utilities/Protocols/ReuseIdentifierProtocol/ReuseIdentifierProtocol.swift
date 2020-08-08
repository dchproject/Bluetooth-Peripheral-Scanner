//
//  ReuseIdentifierProtocol.swift
//  Albumist
//
//  Created by qwerty on 10/9/19.
//  Copyright © 2019 qwerty. All rights reserved.
//

import Foundation

protocol ReuseIdentifierProtocol {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifierProtocol {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
}

protocol ViewProtocol: ReuseIdentifierProtocol {
    
}

protocol CellProtocol: ViewProtocol {
    
}
