//
//  SecondViewController.swift
//  DrawProject
//
//  Created by Benny Davidovitz on 12/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        let smileView = self.view as? SmileView
        smileView?.factor = CGFloat(sender.value)
        
    }

    

}

