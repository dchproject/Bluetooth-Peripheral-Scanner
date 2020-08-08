//
//  DeviceDetailViewModel.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created Admin on 8/8/20.
//  Copyright Â© 2020 Admin. All rights reserved.
//

import UIKit
import RxBluetoothKit

// MARK: - View Model
protocol DeviceDetailViewModel: class {
    init(router: DeviceDetailRouter, senderType: DeviceDetailSenderType)
    
    func peripheral() -> ScannedPeripheral
}

final class BPSDeviceDetailViewModel: DeviceDetailViewModel {
    
    fileprivate let router: DeviceDetailRouter
    fileprivate let senderType: DeviceDetailSenderType
    
    init(router: DeviceDetailRouter, senderType: DeviceDetailSenderType) {
        self.router = router
        self.senderType = senderType
    }
    
    deinit {
        debugPrint(#function, "\(BPSDeviceDetailViewModel.self)")
    }
    
}

// MARK: - Peripheral
extension BPSDeviceDetailViewModel {
    
    func peripheral() -> ScannedPeripheral {
        return self.senderType.peripheral
    }
    
}
