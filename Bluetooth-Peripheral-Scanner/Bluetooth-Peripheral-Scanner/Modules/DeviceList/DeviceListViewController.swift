//
//  DeviceListViewController.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created Admin on 8/8/20.
//  Copyright Â© 2020 Admin. All rights reserved.
//

import UIKit

final class DeviceListViewController: UIViewController {
    
    fileprivate let viewModel: DeviceListViewModel, router: DeviceListRouter
    
    init(viewModel: DeviceListViewModel, router: DeviceListRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Required init error" + "\(DeviceListViewController.self)")
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
fileprivate extension DeviceListViewController {
    
    func setupUI() {
        
    }
    
}

// MARK: - Add UI
fileprivate extension DeviceListViewController {
    
   
}

// MARK: - Setup Constraints
fileprivate extension DeviceListViewController {
    
    func setupConstraints() {
       
    }
    
}

// MARK: - Make Constraints
fileprivate extension DeviceListViewController {
    
  
}

// MARK: - Configure UI
fileprivate extension DeviceListViewController {
    
    func configureUI() {
        self.view.backgroundColor = AppStyling.Color.systemWhite.color()
        //---------------------------------------------------------------//
        self.title = KeysForTranslate.deviceList.localized
        //---------------------------------------------------------------//
    }
    
}
