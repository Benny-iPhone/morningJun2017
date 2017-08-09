//
//  ViewController.swift
//  AlertControllerProject
//
//  Created by Benny Davidovitz on 06/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func passwordAlertAction(_ sender: Any) {
        let alert = UIAlertController(title: "Login", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Log in", style: .default, handler: { _ in
            
            guard let email = alert.textFields?.first?.text,
                let password = alert.textFields?.last?.text else{
                    print("wrong credentials")
                    return
            }
            
            if email == "a@a.com" && password == "P455W0RD"{
                print("login success")
            } else {
                print("wrong credentials")
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField {
            $0.placeholder = "type email"
            $0.keyboardType = .emailAddress
        }
        
        alert.addTextField {
            $0.placeholder = "type password"
            $0.isSecureTextEntry = true
        }
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func alertWithTextfieldAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add New Item", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (_) in
            
            guard let text = alert.textFields?.first?.text else{
                return
            }
            
            print("adding item with name " + text)
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        //alert.addTextField(configurationHandler: <#T##((UITextField) -> Void)?##((UITextField) -> Void)?##(UITextField) -> Void#>)
        alert.addTextField {
            //config text field ($0)
            $0.placeholder = "type name"
        }
        
        self.present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func simpleAlertAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Delete Item", message: "Are you sure?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "no", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        alert.addAction(UIAlertAction(title: "yes", style: .destructive, handler: { (_) in
            print("yes")
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func selectImageSheetAction(_ sender: Any) {
        
        let sheet = UIAlertController(title: "Select Source", message: nil, preferredStyle: .actionSheet)
        
        func handler(_ action : UIAlertAction){
            
            guard let title = action.title else {
                return
            }
            
            let picker = UIImagePickerController()
            switch title {
            case "Photo Album":
                picker.sourceType = .photoLibrary
            case "Rear Camera":
                picker.sourceType = .camera
                picker.cameraDevice = .rear
            case "Front Camera":
                picker.sourceType = .camera
                picker.cameraDevice = .front
            default:
                return
            }
            
            picker.delegate = self
            
            self.present(picker, animated: true, completion: nil)
            
        }
        
        sheet.addAction(UIAlertAction(title: "Photo Album", style: .destructive, handler: handler))
        sheet.addAction(UIAlertAction(title: "Rear Camera", style: .default, handler: handler))
        sheet.addAction(UIAlertAction(title: "Front Camera", style: .default, handler: handler))
        
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(sheet, animated: true, completion: nil)
        
    }
    
}

extension ViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        picker.dismiss(animated: true) { 
            self.imageView.image = image
        }
        
    }
    
}

















