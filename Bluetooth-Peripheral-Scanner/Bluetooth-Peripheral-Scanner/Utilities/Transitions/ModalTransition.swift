//
//  ModalTransition.swift
//  Albumist
//
//  Created by qwerty on 10/10/19.
//  Copyright © 2019 qwerty. All rights reserved.
//

import UIKit

final class ModalTransition: NSObject {
    
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
extension ModalTransition: Transition {
    
    func open(_ viewController: UIViewController) {
        viewController.transitioningDelegate = self
        viewController.modalTransitionStyle = modalTransitionStyle
        viewController.modalPresentationStyle = modalPresentationStyle
        
        if #available(iOS 13.0, *) {
            viewController.overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        
        self.viewController?.present(viewController, animated: isAnimated, completion: nil)
    }
    
    func close(_ viewController: UIViewController, completionHandler: (() -> Void)?) {
        viewController.dismiss(animated: isAnimated, completion: completionHandler)
    }
}

// MARK: - UIViewControllerTransitioningDelegate
extension ModalTransition: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else {
            return nil
        }
        animator.isPresenting = true
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else {
            return nil
        }
        animator.isPresenting = false
        return animator
    }
}
