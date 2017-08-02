//
//  MacOSXViewController.swift
//  Pickers
//
//  Created by Benny Davidovitz on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class MacOSXViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var osNamePickerView: UIPickerView!
    let pickerArray : [String] = [
        "Cheetah",
        "Puma",
        "Jaguar",
        "Panther",
        "Tiger",
        "Leopard",
        "Snow Leopard",
        "Lion",
        "Mountain Lion",
        "Mavericks",
        "Yosemite",
        "El Capitan",
        "Sierra"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - UIPickerView Methods -
    //data source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
   
    //delegate
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let text = pickerArray[row]
        let color : UIColor = (row % 2 == 0) ? .blue : .red
        
        let atts = [
            NSForegroundColorAttributeName:color,
            NSFontAttributeName:UIFont.boldSystemFont(ofSize: 16)
        ]
        
        return NSAttributedString(string: text,
                                  attributes: atts)
    }
    
    /*
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
 
 */
    
    

}














