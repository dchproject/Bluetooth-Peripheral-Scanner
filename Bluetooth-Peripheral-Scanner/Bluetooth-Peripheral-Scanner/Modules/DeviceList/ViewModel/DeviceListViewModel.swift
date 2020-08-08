//
//  DeviceListViewModel.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created Admin on 8/8/20.
//  Copyright Â© 2020 Admin. All rights reserved.
//

import UIKit

// MARK: - View Model
protocol DeviceListViewModel: class {
    init(router: DeviceListRouter)
}

final class BPSDeviceListViewModel: DeviceListViewModel {
    
    fileprivate let router: DeviceListRouter
    
    init(router: DeviceListRouter) {
        self.router = router
    }
    
    deinit {
        debugPrint(#function, "\(BPSDeviceListViewModel.self)")
    }
    
}

extension BPSDeviceListViewModel {
    
}
