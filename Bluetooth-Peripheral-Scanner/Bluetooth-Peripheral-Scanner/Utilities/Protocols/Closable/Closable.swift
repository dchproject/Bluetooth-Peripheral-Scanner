//
//  Closable.swift
//  Albumist
//
//  Created by qwerty on 10/10/19.
//  Copyright © 2019 qwerty. All rights reserved.
//

import Foundation

protocol Closable: class {
    func close(completionHandler: (() -> Void)?)
}
