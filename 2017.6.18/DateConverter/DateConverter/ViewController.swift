//
//  ViewController.swift
//  DateConverter
//
//  Created by Benny Davidovitz on 18/06/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    enum ConvertType : Int{
        case gregToHeb //0
        case hebToGreg //1
        case gregToChinese
        
        func origin() -> Calendar{
            switch self {
            case .gregToHeb, .gregToChinese:
                return Calendar(identifier: .gregorian)
            case .hebToGreg:
                return Calendar(identifier: .hebrew)
            }
        }
        
        func destination() -> Calendar{
            switch self {
            case .gregToHeb: return Calendar(identifier: .hebrew)
            case .hebToGreg: return Calendar(identifier: .gregorian)
            case .gregToChinese: return Calendar(identifier: .chinese)
            }
        }
    }
    
    var type : ConvertType = .gregToHeb{
        didSet{
            //refresh date picker
            datePicker.calendar = type.origin()
            //refresh label
            dateChanged(datePicker)

            //oldValue
        }
    }
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        
        let index : Int = sender.selectedSegmentIndex
        guard let t = ConvertType(rawValue: index) else {
            print("unsupported index \(index)")
            return
        }
        
        self.type = t
        /*
         class Person{
         var string : String
         }
         */

        /*
        //refresh date picker
        datePicker.calendar = type.origin()
        //refresh label
        dateChanged(datePicker)
        */
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.calendar = type.destination()
        //formatter.calendar = Calendar(identifier: .hebrew)
        formatter.locale = Locale(identifier: "he")
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        //formatter.doesRelativeDateFormatting = true
        
        let date : Date = sender.date
        let str = formatter.string(from: date)
        label2.text = str
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dateChanged(datePicker)
        //datePicker.sendActions(for: .valueChanged)
        segmentedControlAction(segmentedControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



