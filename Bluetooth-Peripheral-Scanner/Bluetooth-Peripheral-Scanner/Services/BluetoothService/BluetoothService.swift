//
//  BluetoothService.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created by Admin on 8/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import RxSwift
import RxCocoa
import RxBluetoothKit
import CoreBluetooth

protocol BluetoothService {
    
    var didScanPeripheral: BehaviorRelay<Peripheral?> { get }
    
    func startScanning()
}

final class BPSBluetoothService: NSObject, BluetoothService {
    
    fileprivate let centralManager: CentralManager
    fileprivate let disposeBag: DisposeBag
    
    let didScanPeripheral: BehaviorRelay<Peripheral?>
    
    override init() {
        self.centralManager = CentralManager.init()
        self.disposeBag = DisposeBag.init()
        self.didScanPeripheral = BehaviorRelay.init(value: nil)
        super.init()
        
    }
    
}

extension BPSBluetoothService {
    
    func startScanning() {
        centralManager.observeState()
            .startWith(centralManager.state)
            .filter { $0 == .poweredOn }
            .take(1)
            .flatMap { [unowned self] _ in self.centralManager.scanForPeripherals(withServices: []) }
            .subscribe { [unowned self] (event) in
                
                self.passScannedPeripheral(event.element)
                
        }.disposed(by: disposeBag)
    }
    
}

// MARK: - Pass Scanned Peripheral
fileprivate extension BPSBluetoothService {
    
    func passScannedPeripheral(_ model: ScannedPeripheral?) {
        self.didScanPeripheral.accept(model?.peripheral)
    }
    
}
