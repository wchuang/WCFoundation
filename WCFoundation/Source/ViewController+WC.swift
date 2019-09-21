//
//  ViewController+WC.swift
//  WCFoundation
//
//  Created by Frank on 2019/9/14.
//  Copyright © 2019 Frank. All rights reserved.
//

import UIKit

// MARK: - Custom AssociatedObject

extension UIViewController {

    private struct AssociatedKeys {
        static var vcDescription = "AssociatedKeys.vcDescription"
    }
    
    var vcDescription: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.vcDescription) as? String
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.vcDescription, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            }
        }
    }
}

// MARK: - Method Swizzling

extension UIViewController {

    static func swizzleViewDidLoad() {
        // Make sure it's not a subclass
        if self != UIViewController.self {
            return
        }
        DispatchQueue.once(token: "UIViewController.swizzleViewDidLoad") { (result) in
            if !result { return }
            // System method you want to hook
            let originalSelector = #selector(UIViewController.viewDidLoad)
            // Your custom method
            let swizzledSelector = Selector(("mySwizzledViewDidLoad"))
            swizzleMethod(aClass: self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
        }
    }

    @objc func mySwizzledViewDidLoad() {
        print("mySwizzledViewDidLoad running")
    }
}
