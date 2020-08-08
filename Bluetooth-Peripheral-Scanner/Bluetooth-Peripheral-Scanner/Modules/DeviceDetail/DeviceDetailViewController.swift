//
//  DeviceDetailViewController.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created Admin on 8/8/20.
//  Copyright Â© 2020 Admin. All rights reserved.
//

import UIKit

final class DeviceDetailViewController: UIViewController {
    
    fileprivate let viewModel: DeviceDetailViewModel, router: DeviceDetailRouter
    
    fileprivate let nameLabel: UILabel = {
        let label = UILabel.init()
        label.font = AppStyling.Font.systemBold.font(ofSize: 16)
        label.textColor = AppStyling.Color.systemBlack.color()
        return label
    }()
    
    fileprivate let rssiLabel: UILabel = {
        let label = UILabel.init()
        label.font = AppStyling.Font.systemBold.font(ofSize: 16)
        label.textColor = AppStyling.Color.systemBlack.color()
        return label
    }()
    
    fileprivate let txPowerLabel: UILabel = {
        let label = UILabel.init()
        label.font = AppStyling.Font.systemBold.font(ofSize: 16)
        label.textColor = AppStyling.Color.systemBlack.color()
        return label
    }()
    
    init(viewModel: DeviceDetailViewModel, router: DeviceDetailRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Required init error" + "\(DeviceDetailViewController.self)")
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
}

// MARK: - Setup UI
fileprivate extension DeviceDetailViewController {
    
    func setupUI() {
        addNameLabel()
        addRssiLabel()
        addTxPowerLabel()
    }
    
}

// MARK: - Add UI
fileprivate extension DeviceDetailViewController {
      
    func addNameLabel() {
        nameLabel.text = configureNameText()
        view.addSubview(nameLabel)
    }
    
    func addRssiLabel() {
        rssiLabel.text = self.configureRSSIText()
        view.addSubview(rssiLabel)
    }
    
    func addTxPowerLabel() {
        txPowerLabel.text = self.configureTxPowerText()
        view.addSubview(txPowerLabel)
    }
    
}

// MARK: - Setup Constraints
fileprivate extension DeviceDetailViewController {
    
    func setupConstraints() {
        makeNameLabelConstraints()
        makeRssiLabelConstraints()
        makeTxPowerLabelConstraints()
    }
    
}

// MARK: - Make Constraints
fileprivate extension DeviceDetailViewController {
    
    func makeNameLabelConstraints() {
        nameLabel.snp.makeConstraints { (make) in
            guard let navBar = self.navigationController?.navigationBar else { return }
            make.top.equalTo(navBar.snp.bottom).offset(32)
            make.left.equalTo(self.view.snp.left).offset(24)
            make.right.equalTo(self.view.snp.right).inset(24)
        }
    }
    
    func makeRssiLabelConstraints() {
        rssiLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(32)
            make.left.equalTo(self.nameLabel.snp.left)
            make.right.equalTo(self.nameLabel.snp.right)
        }
    }
    
    func makeTxPowerLabelConstraints() {
        txPowerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.rssiLabel.snp.bottom).offset(32)
            make.left.equalTo(self.rssiLabel.snp.left)
            make.right.equalTo(self.rssiLabel.snp.right)
        }
    }
    
}

// MARK: - Configure UI
fileprivate extension DeviceDetailViewController {
    
    func configureUI() {
        self.view.backgroundColor = AppStyling.Color.systemWhite.color()
        //---------------------------------------------------------------//
        self.title = KeysForTranslate.deviceDetail.localized
        //---------------------------------------------------------------//
    }
    
}

// MARK: - Configured RSSI Text
fileprivate extension DeviceDetailViewController {
    
    func configureRSSIText() -> String {
        return Constants.StaticText.rssi + Constants.StaticText.colon + Constants.StaticText.space + viewModel.peripheral().rssi.stringValue
    }
    
}

// MARK: - Configured TxPower Text
fileprivate extension DeviceDetailViewController {
    
    func configureTxPowerText() -> String {
        return Constants.StaticText.txPower + Constants.StaticText.colon + Constants.StaticText.space + (viewModel.peripheral().advertisementData.txPowerLevel?.stringValue ?? KeysForTranslate.unknown.localized)
    }
    
}

// MARK: - Configured Name Text
fileprivate extension DeviceDetailViewController {
    
    func configureNameText() -> String {
        return KeysForTranslate.name.localized + Constants.StaticText.colon + Constants.StaticText.space + (viewModel.peripheral().peripheral.name ?? KeysForTranslate.unknown.localized)
    }
    
}
