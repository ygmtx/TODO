//
//  Draw.swift
//  日常技巧
//
//  Created by terencege on 2018/5/29.
//  Copyright © 2018年 terencege. All rights reserved.
//

import UIKit

extension ViewController: CALayerDelegate {

    func drawImage() {
        let imageView = UIImageView()
        imageView.frame.size = CGSize(width: UIScreen.main.bounds.width, height: 49)
        imageView.center = self.view.center
        imageView.backgroundColor = UIColor.red
        imageView.isUserInteractionEnabled = true
        self.view.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "tab_back").stretchableMiddle(size: imageView.frame.size)

        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.contents = #imageLiteral(resourceName: "tab_back").cgImage
        layer.contentsScale = UIScreen.main.scale
        //        layer.contentsGravity = kCAGravityResizeAspect
        layer.contentsCenter = CGRect(x: 0.05, y: 0.5, width: 0.06, height: 0.55)
        layer.frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: 100)
        layer.delegate = self
        view.layer.addSublayer(layer)
        layer.display()
    }

    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setStrokeColor(UIColor.blue.cgColor)
        ctx.setLineWidth(5)
        ctx.addEllipse(in: CGRect(x: 10, y: 10, width: 50, height: 50))
        ctx.drawPath(using: .stroke)

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

        UIGraphicsEndImageContext()

        image = image.stretchableImage(withLeftCapWidth: Int(tempWidth - 1), topCapHeight: Int(imgVSize.height * 0.8))

        return image
    }
}
