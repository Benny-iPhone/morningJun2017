//
//  CircleView.swift
//  DrawProject
//
//  Created by Benny Davidovitz on 12/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

@IBDesignable class CircleView: UIView {
    
    @IBInspectable var lineWidth : CGFloat = 10{
        didSet{
            //refresh
            setNeedsDisplay()
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
        backgroundColor = .white
    }
    
    

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        guard let context = UIGraphicsGetCurrentContext() else{
            return
        }
        
        let strokeSize = max(min(20, lineWidth),1)
        
        var circleRect : CGRect = bounds
        let d = strokeSize / 2
        //horizontal handling
        circleRect.origin.x += d
        circleRect.size.width -= 2 * d
        //vertical handling
        circleRect.origin.y += d
        circleRect.size.height -= 2 * d
        
        
        //context.addEllipse(in: circleRect)
        context.addArc(
            center: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: min(bounds.width, bounds.height) / 2 - d,
            startAngle: 0,
            endAngle: CGFloat.pi * 2,
            clockwise: false
        )
        
        context.setLineWidth(strokeSize)
        
        context.strokePath()
        
        //make smile
        //context.move(to: <#T##CGPoint#>)
        //context.addCurve(to: <#T##CGPoint#>, control1: <#T##CGPoint#>, control2: <#T##CGPoint#>)
        
    }
    

}



















