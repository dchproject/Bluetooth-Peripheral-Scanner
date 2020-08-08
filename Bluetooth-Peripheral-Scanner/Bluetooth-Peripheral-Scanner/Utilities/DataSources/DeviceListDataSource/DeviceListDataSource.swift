//
//  DeviceListDataSource.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created by Admin on 8/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import RxBluetoothKit

protocol DeviceListItems {
    var peripherals: [ScannedPeripheral] { get set }
}

protocol DeviceListItem: DeviceListItems {
    func peripheral(atIndexPath indexPath: IndexPath) -> ScannedPeripheral?
}

extension DeviceListItem {
    
    func peripheral(atIndexPath indexPath: IndexPath) -> ScannedPeripheral? {
        if (peripherals.isEmpty) {
            return nil
        } else {
            return peripherals[indexPath.row]
        }
    }
    
}

protocol DeviceListDataSource: UICollectionViewDataSource, DeviceListItem {
    
}

final class BPSDeviceListDataSource: NSObject, DeviceListDataSource {
    
    var peripherals: [ScannedPeripheral]
    
    init(peripherals: [ScannedPeripheral]) {
        self.peripherals = peripherals
        super.init()
    }
    
}

extension BPSDeviceListDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peripherals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeviceListCell.reuseIdentifier, for: indexPath) as! DeviceListCell
        cell.configure(type: .init(peripheral: peripheral(atIndexPath: indexPath)))
        return cell
    }
        
}
