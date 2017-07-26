//
//  ViewController.swift
//  LabelProject
//
//  Created by Benny Davidovitz on 19/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 30, y: 100, width: 200, height: 10))
        label.text = "hello 😀 world hello 😀 world hello 😀 world hello 😀 world\nhello 😀 world\nhello 😀 world\nhello 😀 world"
        label.numberOfLines = 0
        //label.sizeToFit()
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        
        //add constraints
        let top = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 8)
        
        let leading = NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 16)
        
        let trailing = NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .greaterThanOrEqual, toItem: label, attribute: .trailing, multiplier: 1, constant: 16)
        
        self.view.addConstraints([top,leading,trailing])
        
        //label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

