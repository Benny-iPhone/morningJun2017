//
//  ViewController.swift
//  TagProject
//
//  Created by Benny Davidovitz on 05/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = self.view.viewWithTag(101) as? UIButton
        //hook IBAction progomatically
        button?.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    func buttonAction(){
        let myView = self.view.viewWithTag(100)
        myView?.backgroundColor = .randomColor
    }


}













