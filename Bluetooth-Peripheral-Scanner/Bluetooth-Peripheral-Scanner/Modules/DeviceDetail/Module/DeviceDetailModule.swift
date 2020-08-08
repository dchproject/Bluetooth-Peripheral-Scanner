//
//  DeviceDetailModule.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created Admin on 8/8/20.
//  Copyright Â© 2020 Admin. All rights reserved.
//

import UIKit
import RxBluetoothKit

struct DeviceDetailSenderType {
    
    let peripheral: ScannedPeripheral
    
    init(peripheral: ScannedPeripheral) {
        self.peripheral = peripheral
    }
    
}

final class DeviceDetailModule {
    var sender: Any?
    
    init(sender: Any?) {
        self.sender = sender
    }
}

extension DeviceDetailModule: Routes {
    
    var transition: Transition {
        return PushTransition()
    }
    
    var module: UIViewController {
        
        guard let senderType = self.sender as? DeviceDetailSenderType else { fatalError("Impossible Cast To DeviceDetailSenderType") }
        
        let router = BPSDeviceDetailRouter()
        let viewModel = BPSDeviceDetailViewModel(router: router, senderType: senderType)
        let viewController = DeviceDetailViewController(viewModel: viewModel, router: router)
        
        router.openTransition = transition
        router.viewController = viewController
        
        return viewController
    }
}
