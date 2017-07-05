//
//  ViewController.swift
//  GesturesProject
//
//  Created by Benny Davidovitz on 05/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBAction func doubleTapAction(_ sender: UITapGestureRecognizer) {
        sender.view?.backgroundColor = .randomColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let myView = self.view.viewWithTag(1) else{
            return
        }
        
        let radians = CGFloat.pi * 0.25 //45 degrees
        myView.transform = CGAffineTransform(rotationAngle: radians)
        
        //back to default
        //myView.transform = .identity
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}











