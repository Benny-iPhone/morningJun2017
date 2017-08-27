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

    @IBOutlet weak var textViewTopLayout: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    var tableArray : [Comic] = []
    
    var char : Character!
    
    @IBOutlet weak var textViewHeightLayout : NSLayoutConstraint!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var bgImageView: UIImageView!
    
    var defaultTop : CGFloat = 0
    var defaultOffset : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        if char.desc.isEmpty{
            textViewHeightLayout.constant = 0
        }
        
        defaultTop = textViewTopLayout.constant
        defaultOffset = defaultTop * 2 + textViewHeightLayout.constant
        
        tableView.contentInset = UIEdgeInsets(top: defaultOffset, left: 0, bottom: 0, right: 0)
        
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
        return 1 + tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let isTitle = indexPath.row == 0
        let identifier = isTitle ? "title_cell" : "cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let label = cell.viewWithTag(1) as? UILabel
        if isTitle{
            
            label?.text = "Comics"
            
        } else {
            
            let comic : Comic = tableArray[indexPath.row - 1]
            
            label?.text = comic.title
            label?.textColor = .red
            //cell.textLabel?.text = comic.title
            cell.accessoryType = comic.purchaseUrl == nil ? .none : .disclosureIndicator
            
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let row = indexPath.row - 1
        guard row >= 0 , row < tableArray.count else{
            return
        }
        
        let comic : Comic = tableArray[row]

        guard let url = comic.purchaseUrl else{
            return
        }
        
        let webVC = WebViewController.webViewController()
        
        
        webVC.name = comic.title
        webVC.url = url
        
        navigationController?.show(webVC, sender: nil)
        //navigationController?.pushViewController(webVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var y = scrollView.contentOffset.y
        y = min(y, 0)
        
        let delta = max(abs(defaultOffset) - abs(y),0)
        
        textViewTopLayout.constant = defaultTop - delta
        
        
        
        print("y: \(scrollView.contentOffset.y)")
        print("delta :\(delta)")

    }
    
}










