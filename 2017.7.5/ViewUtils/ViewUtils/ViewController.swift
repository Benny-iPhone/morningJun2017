//
//  ViewController.swift
//  ViewUtils
//
//  Created by Benny Davidovitz on 05/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var hideSwitch: UISwitch!
    
    @IBAction func hideAction(_ sender: UISwitch) {
        myView.isHidden = !sender.isOn
        alphaSlider.isHidden = !sender.isOn
    }
    
    @IBAction func changeBackgroundColorAlphaAction(_ sender: UISlider) {
        myView.backgroundColor = myView.backgroundColor?.withAlphaComponent(CGFloat(sender.value))
    }
    
    @IBAction func alphaSliderAction(_ sender: UISlider) {
        
        myView.alpha = CGFloat(sender.value)
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        print(#function)
        
    }
    
    @IBAction func interactionSwitchAction(_ sender: UISwitch) {
        
        myView.isUserInteractionEnabled = sender.isOn
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hideSwitch.sendActions(for: .valueChanged)
        hideAction(hideSwitch)
        alphaSliderAction(alphaSlider)
        
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = #imageLiteral(resourceName: "background")
        //self.view.addSubview(imageView)
        //view.sendSubview(toBack: imageView)
        
        self.view.insertSubview(imageView, at: 0)
        
        //self.view.insertSubview(imageView, aboveSubview: myView)
    }

    


}













