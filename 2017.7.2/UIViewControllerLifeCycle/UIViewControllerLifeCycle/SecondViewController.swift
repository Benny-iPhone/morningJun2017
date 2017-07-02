//
//  SecondViewController.swift
//  UIViewControllerLifeCycle
//
//  Created by Benny Davidovitz on 02/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print(String(describing: type(of: self)))
        //print(String(describing: FirstViewController.self))
        print(#function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(String(describing: type(of: self)))
        print(#function)
        
        self.navigationItem.title = "Second VC"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(String(describing: type(of: self)))
        print(#function)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(String(describing: type(of: self)))
        print(#function)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print(String(describing: type(of: self)))
        print(#function)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print(String(describing: type(of: self)))
        print(#function)
        
    }
    
    deinit {
        print(String(describing: type(of: self)))
        print(#function)

    }
    
}
