//
//  ViewController.swift
//  日常技巧
//
//  Created by terencege on 2018/5/22.
//  Copyright © 2018年 terencege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black

        let imageView = UIImageView()
        imageView.frame.size = CGSize(width: UIScreen.main.bounds.width, height: 49)
        imageView.center = view.center
        view.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "tab_back").stretchableMiddle(size: imageView.frame.size)
        imageView.frame.size = imageView.image!.size
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIImage {

    func stretchableMiddle(size container: CGSize) -> UIImage {

        let imgSize = self.size
        let imgVSize = CGSize(width: Double(container.width), height: Double(container.height))
        let tempWidth = (imgSize.width + imgVSize.width)/2

        let stretchImg = self.stretchableImage(withLeftCapWidth: Int(0.1 * imgSize.width), topCapHeight: Int(imgSize.height * 0.8))

        UIGraphicsBeginImageContextWithOptions(CGSize(width: tempWidth, height: imgVSize.height), false, UIScreen.main.scale)

        stretchImg.draw(in: CGRect(x: 0, y: 0, width: tempWidth, height: imgVSize.height))

        var image = UIGraphicsGetImageFromCurrentImageContext()!

//        UIGraphicsEndImageContext()
//
//        image = image.stretchableImage(withLeftCapWidth: Int(tempWidth - 1), topCapHeight: Int(imgVSize.height * 0.8))

        return image
    }
}
