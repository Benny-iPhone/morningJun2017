//
//  RedButton.swift
//  ButtonProject
//
//  Created by Benny Davidovitz on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class RedButton: UIButton {

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
        backgroundColor = .red
        setTitleColor(.white, for: .normal)
        setTitleColor(.red, for: .highlighted)
        
        layer.cornerRadius = self.bounds.height * 0.5
        //layer.masksToBounds = true
        layer.borderColor = UIColor.red.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowOpacity = 1
        
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        
        
    }

    //after constraints refresh
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.bounds.height * 0.5

    }
    
    private func makeHighligh(_ h : Bool){
        if h{
            
            backgroundColor = .white
            layer.borderWidth = 1
            
        } else {
            
            backgroundColor = .red
            layer.borderWidth = 0
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        makeHighligh(true)
        return super.beginTracking(touch, with: event)
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        makeHighligh(false)
        super.endTracking(touch, with: event)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        makeHighligh(false)
        super.cancelTracking(with: event)
    }
}












