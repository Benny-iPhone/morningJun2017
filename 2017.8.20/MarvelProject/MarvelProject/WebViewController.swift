//
//  WebViewController.swift
//  MarvelProject
//
//  Created by Benny Davidovitz on 20/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    var url : URL?
    var name : String?
    
    @IBOutlet weak var webView: UIWebView!
    
    class func webViewController() -> WebViewController{
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = name
        if let url = url{
            webView.loadRequest(URLRequest(url: url))
        }
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
