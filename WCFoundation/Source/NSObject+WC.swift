//
//  NSObject+WC.swift
//  WCFoundation
//
//  Created by Frank on 2019/9/21.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

extension NSObject {

    static func swizzleMethod(aClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
        guard let originalMethod = class_getInstanceMethod(aClass, originalSelector),
            let swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector) else {
                print("Cannot find your custom method")
                return
        }
        let methodAddSuccess = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        if methodAddSuccess {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}
