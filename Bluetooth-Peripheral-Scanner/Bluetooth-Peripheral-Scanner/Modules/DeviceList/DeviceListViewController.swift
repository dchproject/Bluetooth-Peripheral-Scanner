//
//  DeviceListViewController.swift
//  Bluetooth-Peripheral-Scanner
//
//  Created Admin on 8/8/20.
//  Copyright Â© 2020 Admin. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class DeviceListViewController: UIViewController {
    
    fileprivate let viewModel: DeviceListViewModel, router: DeviceListRouter, disposeBag: DisposeBag
    
    fileprivate let collectionView: UICollectionView = {
        let flowLayout: UICollectionViewFlowLayout = .init()
        let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: flowLayout)
        
        collectionView.backgroundColor = AppStyling.Color.systemWhite.color()
        
        collectionView.register(DeviceListCell.self, forCellWithReuseIdentifier: DeviceListCell.reuseIdentifier)
        
        return collectionView
    }()
    
    init(viewModel: DeviceListViewModel, router: DeviceListRouter) {
        self.viewModel = viewModel
        self.router = router
        self.disposeBag = DisposeBag.init()
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
        subscribe()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
}

// MARK: - Setup UI
fileprivate extension DeviceListViewController {
    
    func setupUI() {
        addCollectionView()
    }
    
}

// MARK: - Add UI
fileprivate extension DeviceListViewController {
    
    func addCollectionView() {
        collectionView.delegate = viewModel.delegate
        collectionView.dataSource = viewModel.dataSource
        view.addSubview(collectionView)
    }
    
}

// MARK: - Setup Constraints
fileprivate extension DeviceListViewController {
    
    func setupConstraints() {
        makeCollectionViewConstraints()
    }
    
}

// MARK: - Make Constraints
fileprivate extension DeviceListViewController {
    
    func makeCollectionViewConstraints() {
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
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

// MARK: - Subscribe
fileprivate extension DeviceListViewController {
    
    func subscribe() {
        insertRowSubscribe()        
    }
    
}

// MARK: - Insert Row Subscribe
fileprivate extension DeviceListViewController {
    
    func insertRowSubscribe() {
        viewModel
            .insertRow
            .subscribe { [weak self] (event) in
                
                guard let element = event.element, let indexPath = element else { return }
                self?.insertRow(indexPath: indexPath)
                
        }.disposed(by: disposeBag)
    }
    
}

// MARK: - Insert Row
fileprivate extension DeviceListViewController {
    
    func insertRow(indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.collectionView.performBatchUpdates({
                self.collectionView.insertItems(at: [indexPath])
            }, completion: nil)
        }
    }
    
}
