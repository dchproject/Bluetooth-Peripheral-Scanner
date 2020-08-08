//
//  NavigationController.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created by Admin on 8/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        configureUI()
    }
    
    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
    
    fileprivate func configureUI() {
        
    }
    
}
