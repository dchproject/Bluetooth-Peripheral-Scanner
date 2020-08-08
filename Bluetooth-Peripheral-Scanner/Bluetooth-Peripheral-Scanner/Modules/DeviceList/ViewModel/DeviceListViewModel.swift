//
//  DeviceListViewModel.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created Admin on 8/8/20.
//  Copyright Â© 2020 Admin. All rights reserved.
//

import UIKit
import RxCocoa
import RxBluetoothKit
import RxSwift

// MARK: - View Model
protocol DeviceListViewModel: class {
    init(router: DeviceListRouter)
}

final class BPSDeviceListViewModel: DeviceListViewModel {
    
    fileprivate let router: DeviceListRouter
    fileprivate let disposeBag: DisposeBag
    // MARK: - Services
    fileprivate let bluetoothService: BluetoothService
    //---------------------------------------------------//
    fileprivate var peripherals: [Peripheral]
    //---------------------------------------------------//
    init(router: DeviceListRouter) {
        self.router = router
        self.disposeBag = DisposeBag.init()
        //-----------------------------------------------------------//
        self.peripherals = []
        // Initialize Services
        self.bluetoothService = Dependencies.shared.bluetoothService
        //-----------------------------------------------------------//
        bluetoothService.startScanning()
        //-----------------------------------------------------------//
        subscribe()
    }
    
    deinit {
        debugPrint(#function, "\(BPSDeviceListViewModel.self)")
    }
    
}

// MARK: - Subscribe
fileprivate extension BPSDeviceListViewModel {
    
    func subscribe() {
        didScanPeripheralSubscribe()
    }
    
}

// MARK: - Did Scan Peripheral Subscribe
fileprivate extension BPSDeviceListViewModel {
    
    func didScanPeripheralSubscribe() {
        bluetoothService
            .didScanPeripheral
            .subscribe { [weak self] (event) in
                
                guard let element = event.element, let model = element else { return }
                self?.peripherals.append(model)
                
                debugPrint("peripherals count: ", self?.peripherals.count ?? 0)
                
        }.disposed(by: disposeBag)
    }
    
}
