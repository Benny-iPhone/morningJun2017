//
//  PersonViewController.swift
//  HitListCoreData
//
//  Created by Benny Davidovitz on 09/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var aliveLabel: UILabel!
    @IBOutlet weak var aliveSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - IBAction Methods
    
    @IBAction func closeKeybordAction(_ sender: Any) {
        firstnameTextField.resignFirstResponder()
        lastnameTextField.resignFirstResponder()
    }
    
    @IBAction func aliveSwitchAction(_ sender: UISwitch) {
        aliveLabel.text = sender.isOn ? "still breathing" : "R.I.P. 😵"
    }

    @IBAction func doneAction(_ sender: Any) {
        
        //Create a person
        let person = Person(context: DBManager.manager.context)
        //Update Properties
        person.firstName = firstnameTextField.text
        person.lastName = lastnameTextField.text
        person.isAlive = aliveSwitch.isOn
        person.createDate = datePicker.date as NSDate
        
        //Save to disk
        DBManager.manager.saveContext()
        
        //pop to tableviewcontroller
        navigationController?.popViewController(animated: true)
        
    }
}



















