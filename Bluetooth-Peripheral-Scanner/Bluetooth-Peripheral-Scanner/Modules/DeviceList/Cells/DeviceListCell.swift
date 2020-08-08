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
        
        let peripheral: ScannedPeripheral?
        
        init(peripheral: ScannedPeripheral?) {
            self.peripheral = peripheral
        }
        
    }
    
    fileprivate let nameLabel: UILabel = {
        let label = UILabel.init()
        label.font = AppStyling.Font.systemBold.font(ofSize: 16)
        label.textColor = AppStyling.Color.systemBlack.color()
        label.textAlignment = .center
        return label
    }()
    
    static let height: CGFloat = 64
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
}

// MARK: - ConfigureProtocol
extension DeviceListCell: ConfigureProtocol {
    
    typealias T = Model
    
    func configure(type: Model) {
        self.nameLabel.text = (type.peripheral?.peripheral.name ?? KeysForTranslate.unknown.localized)
    }
    
}

// MARK: - Setup UI
fileprivate extension DeviceListCell {
    
    func setupUI() {
        addNameLabel()
    }
    
}

// MARK: - Add UI
fileprivate extension DeviceListCell {
    
    func addNameLabel() {
        addSubview(nameLabel)
    }
    
}

// MARK: - Setup Constraints
fileprivate extension DeviceListCell {
    
    func setupConstraints() {
        makeNameLabelConstraints()
    }
    
}

// MARK: - Make Constraints
fileprivate extension DeviceListCell {
    
    func makeNameLabelConstraints() {
        nameLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
}
