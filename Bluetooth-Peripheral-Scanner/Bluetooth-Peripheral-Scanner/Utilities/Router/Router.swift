//
//  Router.swift
//  Albumist
//
//  Created by qwerty on 10/10/19.
//  Copyright © 2019 qwerty. All rights reserved.
//

import UIKit

open class Router<U>: RouterProtocol, Closable where U: UIViewController {
    
    typealias V = U
    
    weak var viewController: V?
    var openTransition: Transition?
    
    func open(_ viewController: UIViewController, transition: Transition) {
        transition.viewController = self.viewController
        transition.open(viewController)
    }
    
    func close(completionHandler: (() -> Void)?) {
        guard let openTransition = openTransition else {
            assertionFailure("You should specify an open transition in order to close a module.")
            return
        }
        guard let viewController = viewController else {
            assertionFailure("Nothing to close.")
            return
        }
        openTransition.close(viewController, completionHandler: {
            completionHandler?()
        })
    }
}
