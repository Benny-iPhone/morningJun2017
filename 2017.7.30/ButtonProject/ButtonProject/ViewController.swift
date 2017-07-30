//
//  ViewController.swift
//  ButtonProject
//
//  Created by Benny Davidovitz on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //custom
        //let button = UIButton(frame: CGRect(x: 20, y: 100, width: 150, height: 70))
        
        //system
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: 100, width: 150, height: 70)
     
        let text = "Win Gold"
        let atts : [String:Any] = [
            NSFontAttributeName:UIFont.boldSystemFont(ofSize: 24),
            NSUnderlineStyleAttributeName:NSUnderlineStyle.styleThick.rawValue,
            NSUnderlineColorAttributeName:UIColor.purple
        ]
        
        let attString = NSMutableAttributedString(string: text, attributes: atts)
        
        let winRange = NSRange(location: 0, length: 3)
        attString.addAttribute(NSForegroundColorAttributeName,
                               value: UIColor.black,
                               range: winRange)
        
        let goldRange = NSRange(location: 4, length: 4)
        attString.addAttribute(NSForegroundColorAttributeName,
                               value: UIColor.yellow,
                               range: goldRange)
        
        button.setAttributedTitle(attString, for: .normal)
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        self.view.addSubview(button)
    }

    func buttonPressed(){
        print(#function)
    }

}












