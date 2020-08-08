//
//  Routes.swift
//  Albumist
//
//  Created by qwerty on 10/10/19.
//  Copyright © 2019 qwerty. All rights reserved.
//

import UIKit

protocol Routes {
    var module: UIViewController { get }
    var transition: Transition { get }
    /// Default is nil
    var sender: Any? { get set }
    init(sender: Any?)
}

extension Routes where Self: RouterProtocol {
    
}
