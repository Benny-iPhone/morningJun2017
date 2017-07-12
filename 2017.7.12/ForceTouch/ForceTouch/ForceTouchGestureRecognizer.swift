//
//  ForceTouchGestureRecognizer.swift
//  ForceTouch
//
//  Created by Benny Davidovitz on 12/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

@available (iOS 9.0, *)
class ForceTouchGestureRecognizer: UIGestureRecognizer {
    var force : CGFloat = 0
    
    convenience init(){
        self.init(target: nil, action: nil)
    }
    
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        self.cancelsTouchesInView = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        self.fireEventWith(state: .began, touches: touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        self.fireEventWith(state: .changed, touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        self.fireEventWith(state: .ended, touches: touches)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        self.fireEventWith(state: .cancelled, touches: touches)
    }
    
    private func fireEventWith(state : UIGestureRecognizerState, touches : Set<UITouch>){
     
        guard let t = touches.first else {
            return
        }
        
        self.force = t.force
        //fire IBAction
        self.state = state
        
    }
    
    override func reset() {
        super.reset()
        force = 0
    }
    
    
    
}













