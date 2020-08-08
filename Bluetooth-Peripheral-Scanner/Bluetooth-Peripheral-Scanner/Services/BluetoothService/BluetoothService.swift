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
    func startScanning()
}

final class BPSBluetoothService: NSObject, BluetoothService {
    
    fileprivate let centralManager: CentralManager
    fileprivate let disposeBag: DisposeBag
    
    override init() {
        self.centralManager = CentralManager.init()
        self.disposeBag = DisposeBag.init()
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
                
                debugPrint(event.element?.peripheral.name ?? KeysForTranslate.unknown.localized)
                
        }.disposed(by: disposeBag)
    }
    
}
