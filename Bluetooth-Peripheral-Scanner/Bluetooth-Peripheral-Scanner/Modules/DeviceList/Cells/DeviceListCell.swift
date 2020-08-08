//
//  DeviceListCell.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created by Admin on 8/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import RxBluetoothKit

final class DeviceListCell: UICollectionViewCell, CellProtocol {
    
    struct Model {
        
        let peripheral: Peripheral?
        
        init(peripheral: Peripheral?) {
            self.peripheral = peripheral
        }
        
    }
    
    static let height: CGFloat = 64
    
}

// MARK: - ConfigureProtocol
extension DeviceListCell: ConfigureProtocol {
    
    typealias T = Model
    
    func configure(type: Model) {
        
    }
    
}
