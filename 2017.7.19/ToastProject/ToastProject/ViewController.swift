//
//  ViewController.swift
//  ToastProject
//
//  Created by Benny Davidovitz on 19/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonAction(_ sender: Any) {
        
        //ToastLabel.toast(with: "test", on: self.view, fadeInDuration: 3, fadeoutDuration: 3, relativeVerticalPosition: 0.4)
        //self.view.toast(with: "test 2")
        
        "hello world".toast()
        
    }

    


}

