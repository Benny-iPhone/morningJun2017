//
//  ViewController.swift
//  TextFieldProject
//
//  Created by Benny Davidovitz on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func tapAction(_ sender: Any) {
        
        self.view.endEditing(true)
        
    }
    
    @IBAction func didEndOnExitAction(_ sender: UITextField) {
        
        if let next = self.view.viewWithTag(sender.tag + 1) as? UITextField{
            next.becomeFirstResponder()
        } else {
            tapAction(sender)
        }
        
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

