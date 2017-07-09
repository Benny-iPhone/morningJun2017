//
//  ViewController.swift
//  MotionEffectProject
//
//  Created by Benny Davidovitz on 09/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let xEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xEffect.minimumRelativeValue = -100
        xEffect.maximumRelativeValue = 100
        
        let yEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yEffect.minimumRelativeValue = -100
        yEffect.maximumRelativeValue = 100
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [xEffect,yEffect]
        
        myView.addMotionEffect(group)
        
        
    }

    
}















