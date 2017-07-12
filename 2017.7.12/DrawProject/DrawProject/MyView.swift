//
//  MyView.swift
//  DrawProject
//
//  Created by Benny Davidovitz on 12/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    var lineWidth : CGFloat = 6{
        didSet{
            //refresh draw
            self.setNeedsDisplay()
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
        self.backgroundColor = .white
    }

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        
        let w = bounds.width
        let h = bounds.height
        
        context?.move(to: CGPoint(x: w * 0.5, y: h * 0.1))
        context?.addLine(to: CGPoint(x: w  * 0.1, y: h * 0.8))
        context?.addLine(to: CGPoint(x: w * 0.9, y: h * 0.8))
        context?.closePath()

        
        //context?.setStrokeColor(UIColor.red.cgColor)
        UIColor.red.setStroke()
        context?.setLineWidth(lineWidth)
        
        UIColor.purple.setFill()
        
        //context?.strokePath()
        //context?.fillPath()
        context?.drawPath(using: .fillStroke)
        
    }
    

}

extension UIColor{
    func mySetFill(){
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
    }
}













