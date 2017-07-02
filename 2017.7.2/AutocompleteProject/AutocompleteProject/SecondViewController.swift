//
//  SecondViewController.swift
//  AutocompleteProject
//
//  Created by Benny Davidovitz on 02/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import GooglePlaces

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        // Do any additional setup after loading the view.
    }

    func displayAutocomplete(){
        let controller = GMSAutocompleteViewController()
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }

}

extension SecondViewController : UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        displayAutocomplete()
        
        return false
    }
}

extension SecondViewController : GMSAutocompleteViewControllerDelegate{
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        textField.text = place.name + " " + (place.formattedAddress ?? "")
        
        viewController.dismiss(animated: true, completion: nil)
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        
        print(error)
        
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}











