//
//  SecondViewController.swift
//  SwipeProject
//
//  Created by Benny Davidovitz on 09/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func unwindToSecond(_ segue : UIStoryboardSegue){
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
