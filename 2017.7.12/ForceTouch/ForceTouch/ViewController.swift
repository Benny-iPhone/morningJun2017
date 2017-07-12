//
//  ViewController.swift
//  ForceTouch
//
//  Created by Benny Davidovitz on 12/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func forceTouchAction(_ sender: ForceTouchGestureRecognizer) {
        
        guard let label = sender.view as? UILabel else {
            return
        }
        
        label.text = String(format: "%.2f", sender.force)
        //sender.force.description
        
    }
    
}

