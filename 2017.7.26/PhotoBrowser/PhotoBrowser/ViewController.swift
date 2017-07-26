//
//  ViewController.swift
//  PhotoBrowser
//
//  Created by Benny Davidovitz on 26/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import SDWebImage
import SKPhotoBrowser

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func downloadImageAction(_ sender: Any) {
        let urlString = "http://www.bhmpics.com/walls/dog_view_landscape-wide.jpg"
        guard let url = URL(string: urlString) else {
            return
        }
        
        imageView.sd_setImage(with: url)
    }
    
    @IBAction func tapAction(_ sender: Any) {
        guard let image = imageView.image else {
            return
        }
        
        let photo = SKPhoto.photoWithImage(image)
        let arr = [photo]
        
        let browser = SKPhotoBrowser(photos: arr)
        self.present(browser, animated: true, completion: nil)
        
    }
    
    @IBAction func showGalleryAction(_ sender: Any) {
        
        let urls : [String] = [
            "https://globallandusechange.org/wp-content/uploads/2017/04/dummy-mountain-road.jpg",
            "https://previews.123rf.com/images/jakobradlgruber/jakobradlgruber1407/jakobradlgruber140700012/30069447-Panoramic-view-of-beautiful-mountain-landscape-in-the-Bavarian-Alps-with-village-of-Berchtesgaden-an-Stock-Photo.jpg",
            "http://www.toimg.net/managed/images/10186899/w660/h370/image.jpg",
            "https://images.fineartamerica.com/images-medium/boulder-county-colorado-landscape-red-road-autumn-view-james-bo-insogna.jpg"
        ]
        
        var images : [SKPhoto] = []
        for str in urls{
            images.append(SKPhoto.photoWithImageURL(str))
        }
        
        let browser = SKPhotoBrowser(photos: images)
        browser.initializePageIndex(images.count / 2)
        self.present(browser, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

