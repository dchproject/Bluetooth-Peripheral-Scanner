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
    // MARK: - Services
    fileprivate let bluetoothService: BluetoothService
    //---------------------------------------------------//
    init(router: DeviceListRouter) {
        self.router = router
        // Initialize Services
        self.bluetoothService = Dependencies.shared.bluetoothService
        //-----------------------------------------------------------//
        bluetoothService.startScanning()
    }
    
    deinit {
        debugPrint(#function, "\(BPSDeviceListViewModel.self)")
    }
    
}

extension BPSDeviceListViewModel {
    
}
