//
//  RouterProtocol.swift
//  Albumist
//
//  Created by qwerty on 10/10/19.
//  Copyright © 2019 qwerty. All rights reserved.
//

import UIKit

protocol RouterProtocol: class {
    associatedtype V: UIViewController
    var viewController: V? { get }
    
    func open(_ viewController: UIViewController, transition: Transition)
}
