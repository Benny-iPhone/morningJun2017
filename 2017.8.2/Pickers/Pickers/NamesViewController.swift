//
//  NamesViewController.swift
//  Pickers
//
//  Created by Benny Davidovitz on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class NamesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let firstNames : [String] = [
        "צבי",
        "אלחנן",
        "אביב",
        "איל"]
    let lastNames : [String] = [
        "סקין",
        "כהן"
    ]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return firstNames.count
        } else {
            return lastNames.count
        }
        //return component == 0 ? firstNames.count : lastNames.count
    }
   
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let size = pickerView.rowSize(forComponent: component)
        let label = UILabel(frame: CGRect(origin: .zero, size: size))
        
        label.text = "  " + (component == 0 ? firstNames[row] : lastNames[row])
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        
        return label
        
    }
    
    /*
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? firstNames[row] : lastNames[row]
    }
 
 */
    
    
    
    
}













