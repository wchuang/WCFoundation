//
//  DemoViewController.swift
//  WCFoundation
//
//  Created by Frank on 2019/9/14.
//  Copyright © 2019 Frank. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        vcDescription()
    }
}

extension DemoViewController {

    func vcDescription() {
        let vc1 = UIViewController()
        vc1.vcDescription = "vc1"
        print("vc1: \(vc1.vcDescription ?? "vc1 no vcDescription")")
        let vc2 = UIViewController()
        vc2.vcDescription = "vc2"
        print("vc2: \(vc2.vcDescription ?? "vc2 no vcDescription")")
    }
}

