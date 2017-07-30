//
//  ViewController.swift
//  StepperButtons
//
//  Created by Benny Davidovitz on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    let numMaxValue : Int = 20
    let numMinValue : Int = 0
    
    var num : Int = 1{
        didSet{
            numLabel.text = "\(num)"
            
            plusButton.isEnabled = num != numMaxValue
            minusButton.isEnabled = num != numMinValue
            
            //save to disk
            let defaults = UserDefaults.standard
            defaults.set(num, forKey: "num")
            defaults.synchronize()
        }
    }
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print(docDir)
        
        //read from disk
        if let val = UserDefaults.standard.object(forKey: "num") as? Int{
            self.num = val
        }
        
        if let val = UserDefaults.standard.object(forKey: "sound") as? Bool{
            soundSwitch.isOn = val
        }
    }

    
    @IBAction func soundAction(_ sender: UISwitch) {
        
        let defaults = UserDefaults.standard
        defaults.set(sender.isOn, forKey: "sound")
        defaults.synchronize()
        
    }
    
    @IBAction func numButtonAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 1://plus
            num = min(num + 1, numMaxValue)
        case 0://minus
            num = max(num - 1, numMinValue)
        default:
            break
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

