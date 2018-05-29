//
//  Notification.swift
//  日常技巧
//
//  Created by terencege on 2018/5/29.
//  Copyright © 2018年 terencege. All rights reserved.
//

import UIKit

let theName = "JKNotification"

class Observer {

    func add() {
        print("\n addObserver -- \(Thread.current)")

        let center = NotificationCenter.default

        // 1.
        center.addObserver(self,
                           selector: #selector(doSomething),
                           name: NSNotification.Name(rawValue: theName),
                           object: nil)

        // 2.
        var token: NSObjectProtocol?
        token = center.addObserver(forName: NSNotification.Name(rawValue: theName),
                                    object: nil,
                                    queue: OperationQueue.main) {_ in
            print("\n 2.received -- \(Thread.current)")
            sleep(3)
            center.removeObserver(token!)
        }

    }

    @objc func doSomething() {
        DispatchQueue.main.async {
            print("\n 1.received -- \(Thread.current)")
            sleep(3)
        }
    }

    deinit {
        print("\n \(self) -- deinit")
    }
}

class Post {

    var obj = Observer()

    init() {

        obj.add()
    }

    func postNotification() {
        DispatchQueue.global().async {
            print("\n post -- \(Thread.current)")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: theName), object: nil)
            print("\n post end")
        }
    }

    deinit {
        print("\n \(self) -- deinit")
    }
}
