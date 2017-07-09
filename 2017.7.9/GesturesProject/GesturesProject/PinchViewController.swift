//
//  PinchViewController.swift
//  GesturesProject
//
//  Created by Benny Davidovitz on 09/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class PinchViewController: UIViewController {

    
    @IBAction func scalePiece(_ gestureRecognizer : UIPinchGestureRecognizer) {
        // Move the anchor point of the view's layer to the touch point
        // so that scaling the view and layer becomes simpler.
        self.adjustAnchorPoint(gestureRecognizer: gestureRecognizer)
        
        // Scale the view by the current scale factor.
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view?.transform =
                (gestureRecognizer.view?.transform.scaledBy(x: gestureRecognizer.scale,
                                                            y: gestureRecognizer.scale))!
            // Set the scale factor to 1.0 to avoid exponential growth
            gestureRecognizer.scale = 1.0
        }
    }
    
    func adjustAnchorPoint(gestureRecognizer : UIGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let view = gestureRecognizer.view
            let locationInView = gestureRecognizer.location(in: view)
            let locationInSuperview = gestureRecognizer.location(in: view?.superview)
            
            // Move the anchor point to the touch point and change the position of the view
            view?.layer.anchorPoint = CGPoint(x: (locationInView.x / (view?.bounds.size.width)!),
                                              y: (locationInView.y / (view?.bounds.size.height)!))
            view?.center = locationInSuperview
        }
    }
    
    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
        switch sender.state {
        case .changed, .began:
            let scale = max(sender.scale,0.3)
            sender.view?.transform = CGAffineTransform(scaleX: scale, y: scale)
        case .ended:
            UIView.animate(withDuration: 0.5, animations: { 
                sender.view?.transform = .identity
            })
            
        default:
            return
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let greenView : UIView? = self.view.viewWithTag(1)
        
        greenView?.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panAction(_:))))
        
        // Do any additional setup after loading the view.
    }
    
    func panAction(_ sender : UIPanGestureRecognizer){
        sender.view?.center = sender.location(in: self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
