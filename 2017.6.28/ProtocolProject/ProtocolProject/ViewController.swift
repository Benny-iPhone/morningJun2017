//
//  ViewController.swift
//  ProtocolProject
//
//  Created by Benny Davidovitz on 28/06/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? SecondViewController{
            nextVC.text = textField.text
            nextVC.delegate = self
        }
    }
    
    //MARK: - IBAction Methods
    
    @IBAction func tapAction(_ sender: AnyObject) {
        
        textField.resignFirstResponder()
        
    }
    

    //MARK: - UITextField Delegate -
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return toggleSwitch.isOn
    }

}

extension ViewController : SecondViewControllerDelegate{
    func secondViewController(_ controller: SecondViewController, didTypeText text: String?) {
        textField.text = text
    }
}










