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

        let queue = OperationQueue.init()
        queue.name = "com.block"

        // 2.
        var token: NSObjectProtocol?
        token = center.addObserver(forName: NSNotification.Name(rawValue: theName),
                                   object: nil,
                                   queue: queue) {_ in
                                    for i in 0...100 {
                                        print("\n 2.received -- \(Thread.current) -- \(i)")
                                    }
                                    center.removeObserver(token!)
        }

        // 1.
        center.addObserver(self,
                           selector: #selector(doSomething),
                           name: NSNotification.Name(rawValue: theName),
                           object: nil)


        // 3.
        center.addObserver(self,
                           selector: #selector(doAnything),
                           name: NSNotification.Name(rawValue: theName),
                           object: nil)


        print(center.description)
        print(queue.description)

    }

    @objc func doSomething() {
        DispatchQueue.global().async {
            for i in 0...100 {
                print("\n 1.received -- \(Thread.current) -- \(i)")
            }
        }
    }

    @objc func doAnything() {
        DispatchQueue.global().async {
            for i in 0...100 {
                print("\n 3.received -- \(Thread.current) -- \(i)")
            }
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
        self.postNotification()
    }

    func postNotification() {

        DispatchQueue.global().async {
            Thread.current.name = "com.dailyiOS"
            print("\n post -- \(Thread.current)")
            let notf = Notification(name: Notification.Name(rawValue: theName))
//            NotificationCenter.default.post(name: notf.name, object: nil)
            NotificationQueue.default.enqueue(notf, postingStyle: .asap, coalesceMask: .onName, forModes: nil)
            print("\n post end -- \(Thread.current)")

            let runloop = RunLoop.current
            runloop.add(Port.init(), forMode: .commonModes)
            runloop.run()
        }
    }

    deinit {
        print("\n \(self) -- deinit")
    }
}
