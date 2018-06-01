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
                                    queue: OperationQueue.init()) {_ in
            print("\n 2.received -- \(Thread.current)")
            sleep(2)
            center.removeObserver(token!)
        }

    }

    @objc func doSomething() {
//        DispatchQueue.main.async {
            print("\n 1.received -- \(Thread.current)")
            sleep(2)
//        }
    }

    deinit {
        print("\n \(self) -- deinit")
    }
}

class Post {

    var obj = Observer()

    init() {
        obj.add()
        self.postNotification()
    }

    func postNotification() {

        DispatchQueue.global().async {
            Thread.current.name = "com.ygmtx"
            print("\n post -- \(Thread.current)")
            let notf = Notification(name: Notification.Name(rawValue: theName))
//            NotificationCenter.default.post(name: notf.name, object: nil)
            NotificationQueue.default.enqueue(notf, postingStyle: .asap)
            print("\n post end -- \(Thread.current)")

            RunLoop.current.add(Port.init(), forMode: .defaultRunLoopMode)
            RunLoop.current.run()
        }
    }

    deinit {
        print("\n \(self) -- deinit")
    }
}
