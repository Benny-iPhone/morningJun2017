//
//  ViewController.swift
//  TraingleHomework
//
//  Created by Benny Davidovitz on 16/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , ColorPickerViewControllerDelegate{

    @IBOutlet weak var triangleView: TriangleView!
    @IBOutlet weak var lineWidthSlider: UISlider!
    
    @IBOutlet weak var frameColorButton : UIButton!
    @IBOutlet weak var fillColorButton: UIButton!
    
    
    var colorChangeSegueIdentifier : String?
    weak var colorChangeSegueButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineWidthSlider.value = Float(triangleView.lineWidth)
        
        frameColorButton.setTitleColor(triangleView.frameColor, for: .normal)
        fillColorButton.setTitleColor(triangleView.fillColor, for: .normal)
        
    }
    
    @IBAction func lineWidthAction(_ sender: UISlider) {
        
        triangleView.lineWidth = CGFloat(sender.value)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? ColorPickerViewController{
            self.colorChangeSegueIdentifier = segue.identifier
            self.colorChangeSegueButton = sender as? UIButton
            nextVC.delegate = self
            nextVC.startColor = (sender as? UIButton)?.titleColor(for: .normal)
            
        }
    }
    
    
    
    func controller(_ controller: ColorPickerViewController, didSelectColor color: UIColor?) {
        
        //make sure we have an identidier to help us determine functionallity
        guard let identifier = colorChangeSegueIdentifier else {
            return
        }
        //make sure color is not nil
        guard let color = color else {
            return
        }
        
        //set title color to relevant button
        colorChangeSegueButton?.setTitleColor(color, for: .normal)
        colorChangeSegueButton = nil
        
        switch identifier {
        case "fillSegue":
            
            triangleView.fillColor = color
            
        case "frameSegue":
        
            triangleView.frameColor = color
            
        default:
            break
        }
        
        //cleanup
        self.colorChangeSegueIdentifier = nil
        
    }
    


}
















