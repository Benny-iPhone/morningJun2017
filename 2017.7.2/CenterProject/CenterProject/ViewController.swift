//
//  ViewController.swift
//  CenterProject
//
//  Created by Benny Davidovitz on 02/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLayout: NSLayoutConstraint!
    @IBOutlet weak var myView: UIView!
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        
        let point = sender.location(in: self.view)
        //myView.center = point
        
        UIView.animate(withDuration: 0.5) { 
            self.myView.center = point
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.layer.cornerRadius = heightLayout.constant / 2
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myView.layer.cornerRadius = myView.frame.size.height / 2
    }


}




















