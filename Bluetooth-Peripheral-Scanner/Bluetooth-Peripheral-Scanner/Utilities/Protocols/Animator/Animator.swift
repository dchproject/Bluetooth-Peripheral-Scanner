//
//  Animator.swift
//  Albumist
//
//  Created by qwerty on 10/10/19.
//  Copyright © 2019 qwerty. All rights reserved.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
