//
//  StringView.swift
//  StringDrawProject
//
//  Created by Benny Davidovitz on 19/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

@IBDesignable class StringView: UIView {
    
    @IBInspectable var text : String?{
        didSet{
            setNeedsDisplay()
        }
    }

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        guard let text = text else {
            return
        }
        
        let str = (text as NSString)
        
        let atts = [
            NSFontAttributeName:UIFont.systemFont(ofSize: 16)
        ]
        
        str.draw(in: bounds, withAttributes: atts)
        
    }
    

}









