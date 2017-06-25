//
//  ViewController.swift
//  HomeworkSliders
//
//  Created by Benny Davidovitz on 25/06/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redLabel : UILabel!
    @IBOutlet weak var blueLabel : UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var colorView: UIView!
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        //redLabel.text = redSlider.value.description
        
        //redLabel.text = String(format: "%.2f", redSlider.value)
        let intVal = Int(redSlider.value * 255) //0...255
        let str = String(intVal, radix: 16)
        redLabel.text = str
        //String(<#T##value: _SignedInteger##_SignedInteger#>, radix: <#T##Int#>, uppercase: <#T##Bool#>)
        blueLabel.text = String(Int(blueSlider.value * 255), radix : 16)
        
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(alphaSlider.value)
        )
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderAction(redSlider)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

