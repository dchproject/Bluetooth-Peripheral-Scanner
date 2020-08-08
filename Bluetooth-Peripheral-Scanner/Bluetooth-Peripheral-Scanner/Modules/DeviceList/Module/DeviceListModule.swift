//
//  DeviceListModule.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created Admin on 8/8/20.
//  Copyright Â© 2020 Admin. All rights reserved.
//

import UIKit

final class DeviceListModule {
    var sender: Any?
    
    init(sender: Any?) {
        self.sender = sender
    }
}

extension DeviceListModule: Routes {
    
    var transition: Transition {
        return PushTransition()
    }
    
    var module: UIViewController {
        
        let router = BPSDeviceListRouter()
        let viewModel = BPSDeviceListViewModel(router: router)
        let viewController = DeviceListViewController(viewModel: viewModel, router: router)
        
        router.openTransition = transition
        router.viewController = viewController
        
        return viewController
    }
}
