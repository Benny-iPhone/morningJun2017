//
//  Utils.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 16/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
//source: https://stackoverflow.com/questions/4334233/how-to-capture-uiview-to-uiimage-without-loss-of-quality-on-retina-display
//
extension UIView {
    public func getSnapshotImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: false)
        let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return snapshotImage
    }
}
