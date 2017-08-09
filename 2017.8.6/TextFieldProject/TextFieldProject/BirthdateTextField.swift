//
//  BirthdateTextField.swift
//  TextFieldProject
//
//  Created by Benny Davidovitz on 06/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class BirthdateTextField: ToolbarTextField {

    let datePicker : UIDatePicker = UIDatePicker()
    var date : Date{
        get{
            return datePicker.date
        }
    }
    
    override func setup(){
        super.setup()
        
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        
        var timestamp = Date().timeIntervalSince1970
        timestamp -= timestamp.truncatingRemainder(dividingBy: 86_400)
        
        datePicker.maximumDate = datePicker.calendar.date(byAdding: .year, value: -18, to: Date(timeIntervalSince1970: timestamp))
        
        datePicker.addTarget(self, action: #selector(BirthdateTextField.dateChanged(_:)), for: .valueChanged)
        
        self.inputView = datePicker
        
    }
    
    override func becomeFirstResponder() -> Bool {
        let r = super.becomeFirstResponder()
        
        if r {
            dateChanged(datePicker)
        }
        
        return r
    }
    
    func dateChanged(_ sender : UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        self.text = formatter.string(from: sender.date)
        
        self.sendActions(for: .editingChanged)
    }

}











