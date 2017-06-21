//
//  ViewController.swift
//  EmailValidationProject
//
//  Created by Benny Davidovitz on 21/06/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

extension String{
    var isValidEmail : Bool{
        get{
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self)
        }
    }
}

class ViewController: UIViewController {

    @IBAction func editingChangedAction(_ sender: UITextField) {
        //make sure text is not nil nor empty
        guard let text = sender.text, !text.isEmpty else {
            return
        }
        
        sender.textColor = text.isValidEmail ? .blue : .red
        
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

