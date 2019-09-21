//
//  DispatchQueue+WC.swift
//  WCFoundation
//
//  Created by Frank on 2019/9/14.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

extension DispatchQueue {

    private static var tokens = Set<String>()

    class func once(token: String, completion: (Bool) -> Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        if tokens.contains(token) {
            completion(false)
            return
        }
        tokens.insert(token)
        completion(true)
    }
}
