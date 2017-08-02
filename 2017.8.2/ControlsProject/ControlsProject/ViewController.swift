//
//  ViewController.swift
//  ControlsProject
//
//  Created by Benny Davidovitz on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySwitch : UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    
    @IBOutlet weak var connectionSwitch: UISwitch!
    
    var reachability : Reachability
    
    required init?(coder aDecoder: NSCoder) {
        reachability = Reachability.forInternetConnection()
        super.init(coder: aDecoder)
    }
    
    @IBAction func mySwitchAction(_ sender: UISwitch) {
        
        //switchLabel.text = sender.isOn.description
        
        switchLabel.text = sender.isOn ? "on" : "off"
    }
    
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var stepperLabel: UILabel!
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        //let text = sender.value.description
        let text = String(format: "%.1f", sender.value)
        stepperLabel.text = text
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.sendActions(for: .valueChanged)
        
        
        let connected = reachability.currentReachabilityStatus() != NotReachable
        connectionSwitch.isOn = connected
        
        reachability.startNotifier()
        
        //NotificationCenter.default.addObserver(forName: <#T##NSNotification.Name?#>, object: <#T##Any?#>, queue: <#T##OperationQueue?#>, using: <#T##(Notification) -> Void#>)
        
        NotificationCenter.default.addObserver(forName: .reachabilityChanged, object: nil, queue: .main) { (notification) in
            
            let connected = self.reachability.currentReachabilityStatus() != NotReachable
            self.connectionSwitch.isOn = connected
            
        }
        
        //NotificationCenter.default.addObserver(<#T##observer: Any##Any#>, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
        
        mySwitch.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        //direct invokation
        mySwitchAction(mySwitch)
        //trigger action
        //mySwitch.sendActions(for: .valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}







