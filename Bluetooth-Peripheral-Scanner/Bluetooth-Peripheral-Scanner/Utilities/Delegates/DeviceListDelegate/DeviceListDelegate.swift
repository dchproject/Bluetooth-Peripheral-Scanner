//
//  DeviceListDelegate.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created by Admin on 8/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxBluetoothKit

protocol DeviceListDelegate: UICollectionViewDelegateFlowLayout, DeviceListItem {
    var didSelectItem: BehaviorRelay<ScannedPeripheral?> { get }
}

final class BPSDeviceListDelegate: NSObject, DeviceListDelegate {
    
    var peripherals: [ScannedPeripheral]
    var didSelectItem: BehaviorRelay<ScannedPeripheral?>
    
    init(peripherals: [ScannedPeripheral]) {
        self.peripherals = peripherals
        self.didSelectItem = BehaviorRelay.init(value: nil)
        super.init()
    }
    
}

extension BPSDeviceListDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItem.accept(peripheral(atIndexPath: indexPath))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: collectionView.bounds.width, height: DeviceListCell.height)
        
    }
    
}
