//
//  ViewController.swift
//  LabelProject2
//
//  Created by Benny Davidovitz on 19/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.textColor = .green
        label.highlightedTextColor = .red
        mySwitch.sendActions(for: .valueChanged)
        
        //label.font = UIFont.italicSystemFont(ofSize: 24)
    }
    
    @IBAction func mySwitchAction(_ sender: UISwitch) {
        label.isHighlighted = sender.isOn
    }
    
    


}

