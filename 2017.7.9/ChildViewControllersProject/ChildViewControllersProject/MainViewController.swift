//
//  MainViewController.swift
//  ChildViewControllersProject
//
//  Created by Benny Davidovitz on 09/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        guard let nextVC = self.viewController(by: index) else {
            return
        }
        
        self.display(vc: nextVC)
    }
    
    @IBAction func swipeNext(){
        var currentIndex = segmentedControl.selectedSegmentIndex
        currentIndex += 1
        if currentIndex == segmentedControl.numberOfSegments{
            currentIndex = 0
        }
        
        segmentedControl.selectedSegmentIndex = currentIndex
        segmentAction(segmentedControl)
    }
    
    private func viewController(by index : Int) -> UIViewController?{
        
        switch index {
        case 0:
            return self.storyboard?.instantiateViewController(withIdentifier: "first")
        case 1:
            return storyboard?.instantiateViewController(withIdentifier: "second")
        case 2:
            return storyboard?.instantiateViewController(withIdentifier: "third")
        default:
            return nil
        }
    }
    
    private func display(vc : UIViewController){
        //remove old
        let oldVC = self.childViewControllers.first
        oldVC?.willMove(toParentViewController: nil)
        oldVC?.view.removeFromSuperview()
        oldVC?.removeFromParentViewController()
        
        //add new
        self.addChildViewController(vc)
        vc.view.frame = containerView.bounds
        containerView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
    
    
    

    

}









