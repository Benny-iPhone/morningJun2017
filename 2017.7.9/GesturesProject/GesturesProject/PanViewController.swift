//
//  PanViewController.swift
//  GesturesProject
//
//  Created by Benny Davidovitz on 09/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class PanViewController: UIViewController {
    
    @IBOutlet weak var redBallImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panAction(_:)))
        redBallImageView.addGestureRecognizer(panGesture)
        
        redBallImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction(_:))))

        // Do any additional setup after loading the view.
    }
    
    func tapAction(_ sender : UITapGestureRecognizer){
        if sender.view?.backgroundColor == .blue{
            sender.view?.backgroundColor = .red
        } else {
            sender.view?.backgroundColor = .blue
        }
    }
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        
        guard let imageView = sender.view else {
            return
        }
        
        imageView.center = sender.location(in: self.view)
        
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
