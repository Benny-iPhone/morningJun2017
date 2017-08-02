//
//  FirstViewController.swift
//  Pickers
//
//  Created by Benny Davidovitz on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func dateChangedAction(_ sender: UIDatePicker) {
        /*
         //display date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        label.text = formatter.string(from: sender.date)
        */
        
        //display age
        
        let comps : DateComponents = sender.calendar.dateComponents([.year], from: sender.date, to: Date())
        
        let age = comps.year!
        
        label.text = "\(age) years old"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var timestamp = Date().timeIntervalSince1970 //second to 2.8.2017 11:12:14.567
        timestamp -= timestamp.truncatingRemainder(dividingBy: 86_400) //second to 2.8.2017 00:00:00.000
        
        let maxDate = Date(timeIntervalSince1970: timestamp)
        datePicker.maximumDate = maxDate
        
        let minDate = datePicker.calendar.date(byAdding: .year, value: -99, to: maxDate)
        datePicker.minimumDate = minDate
        
        datePicker.date = datePicker.calendar.date(byAdding: .year, value: -18, to: maxDate) ?? maxDate
        
        datePicker.sendActions(for: .valueChanged)
    }



}









