//
//  CheckboxImageView.swift
//  UIImageViewProject
//
//  Created by Benny Davidovitz on 26/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class CheckboxImageView: UIImageView {
    
    var checked : Bool{
        get{
            return self.isHighlighted
        }
        set{
            self.isHighlighted = newValue
        }
    }
    
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
        self.image = #imageLiteral(resourceName: "icons8-unchecked_checkbox_filled")
        self.highlightedImage = #imageLiteral(resourceName: "icons8-checked_checkbox_filled")
        self.isUserInteractionEnabled = true
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.addGestureRecognizer(tapGesture)
    }
    
    
    
    func tapAction(){
        self.checked = !self.checked
    }
    
    
    
}



















