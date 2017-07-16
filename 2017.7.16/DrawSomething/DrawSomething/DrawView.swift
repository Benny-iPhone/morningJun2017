//
//  DrawView.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 16/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class DrawView: UIView {

    private var beziers : [UIBezierPath] = []
    private var redoBeziers : [UIBezierPath] = []
    
    var strokeWidth : CGFloat = 1
    var strokeColor : UIColor?
    
    func clear(){
        beziers = []
        redoBeziers = []
        setNeedsDisplay()
    }
    
    func undo(){
        guard !beziers.isEmpty else {
            return
        }
        
        let oldB = beziers.removeLast()
        redoBeziers.append(oldB)
        setNeedsDisplay()
    }
    
    func redo(){
        guard !redoBeziers.isEmpty else {
            return
        }
        
        let b = redoBeziers.removeLast()
        beziers.append(b)
        setNeedsDisplay()
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
        isMultipleTouchEnabled = false
    }
    
    private func startWith(point : CGPoint){
        redoBeziers = []
        
        let b = ColorBezierPath()
        b.lineWidth = strokeWidth
        b.strokeColor = strokeColor
        b.move(to: point)
        beziers.append(b)
    }
    
    private func addLineWith(point : CGPoint){
        guard let b = beziers.last else {
            return
        }
        b.addLine(to: point)
        setNeedsDisplay()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let t = touches.first else {
            return
        }
        
        let p = t.location(in: self)
        startWith(point: p)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let t = touches.first else {
            return
        }
        
        let p = t.location(in: self)
        addLineWith(point: p)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        guard let t = touches.first else {
            return
        }
        
        let p = t.location(in: self)
        addLineWith(point: p)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        guard let t = touches.first else {
            return
        }
        
        let p = t.location(in: self)
        addLineWith(point: p)
    }
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        for b in beziers{
            b.stroke()
        }
        
    }
    

}





















