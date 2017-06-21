//
//  ViewController.swift
//  DateConverter
//
//  Created by Benny Davidovitz on 18/06/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .hebrew)
        formatter.locale = Locale(identifier: "he")
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        
        let str = formatter.string(from: sender.date)
        label2.text = str
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dateChanged(datePicker)
        datePicker.sendActions(for: .valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}













