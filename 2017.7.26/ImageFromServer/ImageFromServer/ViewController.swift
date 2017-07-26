//
//  ViewController.swift
//  ImageFromServer
//
//  Created by Benny Davidovitz on 26/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func loadImageAction(_ sender: UIButton) {
        
        
        imageView.image = nil
        activityIndicatorView.startAnimating()
        sender.isEnabled = false
        
        let urlString = "http://www.bhmpics.com/walls/dog_view_landscape-wide.jpg"
        guard let url = URL(string: urlString) else{
            debugPrint("url not valid")
            return
        }

        //clear cache for specific url
        //SDImageCache.shared().removeImage(forKey: urlString, fromDisk: true, withCompletion: nil)
        //clear all cache
        //SDImageCache.shared().clearMemory()
        

        
        //imageView.sd_setImage(with: url)
        //imageView.sd_setImage(with: <#T##URL?#>, completed: <#T##SDExternalCompletionBlock?##SDExternalCompletionBlock?##(UIImage?, Error?, SDImageCacheType, URL?) -> Void#>)
        imageView.sd_setImage(with: url) { (_, _, _, _) in
            self.activityIndicatorView.stopAnimating()
            sender.isEnabled = true
        }
        
        
    }
    
    
    
    func betterThanNotNechman(){
        //sender.isEnabled = false
        imageView.image = nil
        activityIndicatorView.startAnimating()
        
        let urlString = "http://www.bhmpics.com/walls/dog_view_landscape-wide.jpg"
        guard let url = URL(string: urlString) else{
            debugPrint("url not valid")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else{
                print(error?.localizedDescription ?? "unknown error")
                return
            }
            
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
                //sender.isEnabled = true
                self.imageView.image = image
            }
            
            }.resume()
    }
    
    func notNechmad(){
        let urlString = "http://www.bhmpics.com/walls/dog_view_landscape-wide.jpg"
        guard let url = URL(string: urlString) else{
            debugPrint("url not valid")
            return
        }
        
        //go to background thread
        DispatchQueue.global().async {
            print("2")
            guard let data = try? Data(contentsOf: url) else{
                return
            }
            let image = UIImage(data: data)
            
            //back to main thread
            DispatchQueue.main.async {
                self.imageView.image = image
                print("done")
            }
        }
        
        print("1")
    }
    

}















