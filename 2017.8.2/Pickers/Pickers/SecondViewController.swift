//
//  SecondViewController.swift
//  Pickers
//
//  Created by Benny Davidovitz on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var demoPickerView: UIPickerView!
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        demoPickerView.dataSource = self
        demoPickerView.delegate = self
    }

    //MARK: - UIPickerView Data Source -
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (component + 1) * 10
    }
    
    //MARK: - UIPickerView Delegate -
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "Row \(row)"
        
    }

}













