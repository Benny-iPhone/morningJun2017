//
//  BorderView.swift
//  InspectableProject
//
//  Created by Benny Davidovitz on 05/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

@IBDesignable class BorderView: UIView {
}

extension UIView{
/*
    @IBInspectable var cornerRadiusPercent : CGFloat{
        set{
            guard newValue >= 0 && newValue <= 1 else {
                return
            }
            self.layer.cornerRadius = newValue * min(bounds.width, bounds.height)
        }
        get{
            return layer.cornerRadius / min(bounds.width, bounds.height)
        }
    }
  */
    @IBInspectable var borderColor : UIColor?{
        set{
            self.layer.borderColor = newValue?.cgColor
        }
        get{
            if let cgColor = self.layer.borderColor{
                return UIColor(cgColor: cgColor)
            } else {
                return nil
            }
        }
    }
    
    @IBInspectable var borderWidth : CGFloat{
        set {
            self.layer.borderWidth = newValue
        }
        get{
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat{
        set{
            self.layer.cornerRadius = newValue
        }
        get{
            return self.layer.cornerRadius
        }
    }

}












