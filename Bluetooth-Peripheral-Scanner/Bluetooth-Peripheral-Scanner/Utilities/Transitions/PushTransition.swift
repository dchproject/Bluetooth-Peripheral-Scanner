//
//  PushTransition.swift
//  Albumist
//
//  Created by qwerty on 10/10/19.
//  Copyright © 2019 qwerty. All rights reserved.
//

import UIKit

final class PushTransition: NSObject {
    
    fileprivate var animator: Animator?
    fileprivate var isAnimated: Bool = true
    
    fileprivate var modalTransitionStyle: UIModalTransitionStyle
    fileprivate var modalPresentationStyle: UIModalPresentationStyle
    
    weak var viewController: UIViewController?
    
    deinit {
        viewController = nil
        animator = nil
    }
    
    init(/// Default is nil
         animator: Animator? = nil,
         /// Default is true
         isAnimated: Bool = true,
         /// Default is .coverVertical
         modalTransitionStyle: UIModalTransitionStyle = .coverVertical,
         /// Default is .fullScreen
         modalPresentationStyle: UIModalPresentationStyle = .fullScreen) {
        
        self.animator = animator
        self.isAnimated = isAnimated
        self.modalTransitionStyle = modalTransitionStyle
        self.modalPresentationStyle = modalPresentationStyle
    }
}

// MARK: - Transition
extension PushTransition: Transition {
    func open(_ viewController: UIViewController) {        
        viewController.hidesBottomBarWhenPushed = true
        viewController.modalTransitionStyle = modalTransitionStyle
        viewController.modalPresentationStyle = modalPresentationStyle
        if #available(iOS 13.0, *) {
            viewController.overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }        
        self.viewController?.navigationController?.delegate = self
        self.viewController?.navigationController?.pushViewController(viewController, animated: isAnimated)
    }
    
    func close(_ viewController: UIViewController, completionHandler: (() -> Void)?) {
        viewController.navigationController?.popViewController(animated: isAnimated)
        completionHandler?()
    }
}

// MARK: - UINavigationControllerDelegate
extension PushTransition: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard let animator = animator else {
            return nil
        }
        if operation == .push {
            animator.isPresenting = true
            return animator
        }
        else {
            animator.isPresenting = false
            return animator
        }
    }
}
