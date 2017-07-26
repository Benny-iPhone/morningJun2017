//
//  BoldLabel.swift
//  SubclassLabel
//
//  Created by Benny Davidovitz on 19/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class BoldLabel: UILabel {

    var edgeInsets : UIEdgeInsets = .zero
    
    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup(){
        //font
        //UIFont.systemFontSize
        //self.font = UIFont(name: "Arial-BoldMT", size: 20)
        self.font = UIFont(name: "Oswald-SemiBold", size: 24)
        //color
        textColor = .purple
        //shadow
        shadowColor = UIColor.black.withAlphaComponent(0.7)
        shadowOffset = CGSize(width: 1, height: 1)
        //bg color
        backgroundColor = .cyan
        //border
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        //alignment
        textAlignment = .center
        //inset
        self.edgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    override func drawText(in rect: CGRect) {
        let newRect = UIEdgeInsetsInsetRect(rect, self.edgeInsets)
        super.drawText(in: newRect)
    }
    
    override var intrinsicContentSize: CGSize{
        get{
            var size = super.intrinsicContentSize
            size.width += self.edgeInsets.left + self.edgeInsets.right
            size.height += self.edgeInsets.top + self.edgeInsets.bottom
            return size
        }
    }

}










