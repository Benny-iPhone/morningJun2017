//
//  GradientView.swift
//  GradientProject
//
//  Created by Benny Davidovitz on 12/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class GradientView: UIView {

    var colors : [UIColor] = [.white]{
        didSet{
            //refrsh colors (gradient layer)
            guard let gradient = self.layer.sublayers?.first as? CAGradientLayer else{
                return
            }
            
            gradient.colors = self.cgColors
            
        }
    }
    
    private var cgColors : [CGColor] {
        get{
            return colors.map { $0.cgColor }
            /*
            let b : [CGColor] = colors.map { (c : UIColor) -> CGColor in
                return c.cgColor
            }
            
            
            
            var arr : [CGColor] = []
            for obj in colors{
                arr.append(obj.cgColor)
            }
            return arr*/
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
        //create gradient layer
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = self.cgColors
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let gradient = self.layer.sublayers?.first as? CAGradientLayer else{
            return
        }

        gradient.frame = self.bounds
    }

}








