//
//  MethodSwizzle.swift
//  dailyiOS
//
//  Created by terencege on 2018/5/31.
//  Copyright © 2018年 terencege. All rights reserved.
//

import UIKit
import Intents

extension ViewController {

    func swizzle() {

        let peo = People()
        peo.run()
        peo.perform(#selector(People.run))

        let cls = People.self
        let orgSel = #selector(People.run)
        let newSel = #selector(runNew)

        if let newMethod = class_getInstanceMethod(ViewController.self, newSel) {

            let newImp = method_getImplementation(newMethod)
            let type = method_getTypeEncoding(newMethod)

            class_replaceMethod(cls, orgSel, newImp, type)

        }

        peo.run()
        peo.perform(#selector(People.run))
    }

    @objc func runNew() {
        print("run new")
    }
}

//方式1
@objc class People: NSObject {
    @objc dynamic func run() {
        print("run")
    }
}

//方式2
//extension People {
//    @objc func run() {
//        print("run")
//    }
//}
