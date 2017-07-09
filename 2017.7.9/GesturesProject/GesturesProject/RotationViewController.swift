//
//  RotationViewController.swift
//  GesturesProject
//
//  Created by Benny Davidovitz on 09/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    @IBOutlet var stars: [UIImageView]!
    var activeTimer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func timerButtonAction(_ sender: Any) {
        
        if let timer = self.activeTimer{
            timer.invalidate()
            self.activeTimer = nil
            return
        }
        
        self.activeTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            //code to execute by timer according to definations
            
            
            let angle = CGFloat.pi * 1 / 16
            for obj in self.stars{
                let newTransform = obj.transform.rotated(by: angle)
                obj.transform = newTransform
            }
            
            
        }
        
    }
    
    @IBAction func rotationAction(_ sender: UIRotationGestureRecognizer) {

        //sender.view?.transform = CGAffineTransform(rotationAngle: sender.rotation)

        guard let imageView = sender.view else {
            return
        }
        
        debugPrint(sender.rotation)
        
        let newTransform = imageView.transform.rotated(by: sender.rotation)
        imageView.transform = newTransform
        
        for obj in stars{
            let t = obj.transform.rotated(by: sender.rotation)
            obj.transform = t
        }
        
        sender.rotation = 0
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
