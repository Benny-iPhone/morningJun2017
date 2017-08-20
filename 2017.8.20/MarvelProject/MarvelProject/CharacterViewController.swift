//
//  CharacterViewController.swift
//  MarvelProject
//
//  Created by Benny Davidovitz on 20/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableArray : [Comic] = []
    
    var char : Character!
    
    @IBOutlet weak var textViewHeightLayout : NSLayoutConstraint!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var bgImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        if char.desc.isEmpty{
            textViewHeightLayout.constant = 0
        }
        
        tableView.contentInset = UIEdgeInsets(top: 32 + textViewHeightLayout.constant, left: 0, bottom: 0, right: 0)
        
        navigationItem.title = char.name
        descTextView.text = char.desc
        bgImageView.sd_setImage(with: char.thumbnailURL, placeholderImage: #imageLiteral(resourceName: "marvel_logo_bg_image"))
        
        MarvelManager.manager.getComicsFor(charID: char.id.description) { (arr, err) in
            guard let arr = arr else{
                print(err?.localizedDescription ?? "unknown error")
                return
            }
            
            self.tableArray = arr
            self.tableView.reloadData()
            
        }
        
        
    }

   

}

extension CharacterViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let comic : Comic = tableArray[indexPath.row]
        
        let label = cell.viewWithTag(1) as? UILabel
        label?.text = comic.title
        label?.textColor = .red
        //cell.textLabel?.text = comic.title
        cell.accessoryType = comic.purchaseUrl == nil ? .none : .disclosureIndicator
        
        cell.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let comic : Comic = tableArray[indexPath.row]

        guard let url = comic.purchaseUrl else{
            return
        }
        
        let webVC = WebViewController.webViewController()
        
        
        webVC.name = comic.title
        webVC.url = url
        
        navigationController?.show(webVC, sender: nil)
        //navigationController?.pushViewController(webVC, animated: true)
    }
}










