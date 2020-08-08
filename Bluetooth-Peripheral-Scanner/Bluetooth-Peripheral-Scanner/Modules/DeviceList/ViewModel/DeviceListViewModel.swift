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
    
    var delegate: DeviceListDelegate { get }
    var dataSource: DeviceListDataSource { get }
        
    var insertRow: BehaviorRelay<IndexPath?> { get }
}

final class BPSDeviceListViewModel: DeviceListViewModel {
    
    fileprivate let router: DeviceListRouter
    fileprivate let disposeBag: DisposeBag
    // MARK: - Services
    fileprivate let bluetoothService: BluetoothService
    //---------------------------------------------------//
    fileprivate var peripherals: [ScannedPeripheral]
    //---------------------------------------------------//
    var delegate: DeviceListDelegate
    var dataSource: DeviceListDataSource
    //---------------------------------------------------//
    var insertRow: BehaviorRelay<IndexPath?>
    //---------------------------------------------------//
    init(router: DeviceListRouter) {
        self.router = router
        self.disposeBag = DisposeBag.init()
        //-----------------------------------------------------------//
        self.peripherals = []
        //-----------------------------------------------------------//
        self.insertRow = BehaviorRelay.init(value: nil)
        //-----------------------------------------------------------//
        // Initialize Services
        self.bluetoothService = Dependencies.shared.bluetoothService
        //-----------------------------------------------------------//
        bluetoothService.startScanning()
        //-----------------------------------------------------------//
        self.delegate = BPSDeviceListDelegate.init(peripherals: [])
        self.dataSource = BPSDeviceListDataSource.init(peripherals: [])
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
        didSelectItemSubscribe()
    }
    
}

// MARK: - Did Scan Peripheral Subscribe
fileprivate extension BPSDeviceListViewModel {
    
    func didScanPeripheralSubscribe() {
        bluetoothService
            .didScanPeripheral
            .subscribe { [weak self] (event) in
               
                guard let element = event.element, let model = element else { return }
                                
                self?.appendPeripheralAndInsertRow(model)
                
                debugPrint("peripherals count: ", self?.peripherals.count ?? 0)
                
        }.disposed(by: disposeBag)
    }
    
}

// MARK: - Did Select Item Subscribe
fileprivate extension BPSDeviceListViewModel {
    
    func didSelectItemSubscribe() {
        delegate
            .didSelectItem
            .subscribe { [weak self] (event) in
            
                guard let element = event.element, let peripheral = element else { return }
                
                self?.router.openDeviceDetail(senderType: .init(peripheral: peripheral))
                
        }.disposed(by: self.disposeBag)
    }
    
}

// MARK: - Append Peripheral
fileprivate extension BPSDeviceListViewModel {
    
    func appendPeripheral(_ peripheral: ScannedPeripheral) {
        self.peripherals.append(peripheral)
        self.delegate.peripherals.append(peripheral)
        self.dataSource.peripherals.append(peripheral)
    }
    
}

// MARK: - Append Peripheral And Insert Row
fileprivate extension BPSDeviceListViewModel {
    
    func appendPeripheralAndInsertRow(_ peripheral: ScannedPeripheral) {
        self.appendPeripheral(peripheral)
        self.insertRow.accept(insertRowIndexPath())
    }
    
}

// MARK: - Insert Row Index Path
fileprivate extension BPSDeviceListViewModel {
    
    func insertRowIndexPath() -> IndexPath {
        return .init(row: self.peripherals.count - 1, section: 0)
    }
    
}
