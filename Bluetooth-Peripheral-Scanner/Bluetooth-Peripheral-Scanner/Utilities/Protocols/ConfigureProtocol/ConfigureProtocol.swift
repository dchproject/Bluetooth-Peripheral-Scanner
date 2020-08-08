//
//  ConfigureProtocol.swift
//  Albumist
//
//  Created by qwerty on 10/9/19.
//  Copyright © 2019 qwerty. All rights reserved.
//

import Foundation

protocol ConfigureProtocol {
    associatedtype T
    func configure(type: T)
}
