//
//  ViewController.swift
//  SDWebImageAnimation
//
//  Created by Benny Davidovitz on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.animationDuration = 2
        imageView.animationRepeatCount = 0
        
        let arr = [
            URL(string: "http://digitalspyuk.cdnds.net/16/24/980x490/landscape-1465813603-gameofthrones0arya.jpg")!,
            URL(string: "http://digitalspyuk.cdnds.net/16/24/768x432/gallery-ustv-game-of-thrones-whitewalkers.jpg")!,
            URL(string: "https://pmcvariety.files.wordpress.com/2017/04/got-season-7.jpg?w=900&h=400&crop=1")!
        ]
        
        imageView.sd_setAnimationImages(with: arr)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

