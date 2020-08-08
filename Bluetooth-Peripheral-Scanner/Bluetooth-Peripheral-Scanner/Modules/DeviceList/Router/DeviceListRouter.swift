//
//  DeviceListRouter.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created Admin on 8/8/20.
//  Copyright Â© 2020 Admin. All rights reserved.
//

import UIKit

// MARK: - Router
protocol DeviceListRouter: class {
    func openDeviceDetail(senderType: DeviceDetailSenderType)
}

final class BPSDeviceListRouter: Router<DeviceListViewController>, DeviceListRouter {
    
    
}

extension BPSDeviceListRouter {

    func openDeviceDetail(senderType: DeviceDetailSenderType) {
        let module = DeviceDetailModule.init(sender: senderType)
        open(module.module, transition: module.transition)
    }
    
}
