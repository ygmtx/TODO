//
//  ViewController.swift
//  日常技巧
//
//  Created by terencege on 2018/5/22.
//  Copyright © 2018年 terencege. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController, CALayerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan

        self.drawImage()

        Post().postNotification()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

