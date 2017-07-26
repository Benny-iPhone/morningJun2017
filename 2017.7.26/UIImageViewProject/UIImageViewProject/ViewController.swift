//
//  ViewController.swift
//  UIImageViewProject
//
//  Created by Benny Davidovitz on 26/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        guard let checkImageView = sender.view as? UIImageView else {
            return
        }
        
        checkImageView.isHighlighted = !checkImageView.isHighlighted
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

