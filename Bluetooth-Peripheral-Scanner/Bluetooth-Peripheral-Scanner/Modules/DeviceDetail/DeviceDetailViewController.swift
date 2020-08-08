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
        
    }
    
}

// MARK: - Add UI
fileprivate extension DeviceDetailViewController {
    
    
}

// MARK: - Setup Constraints
fileprivate extension DeviceDetailViewController {
    
    func setupConstraints() {
        
    }
    
}

// MARK: - Make Constraints
fileprivate extension DeviceDetailViewController {
    
    
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
