//
//  SearchViewController.swift
//  MarvelProject
//
//  Created by Benny Davidovitz on 16/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CCBottomRefreshControl

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView : UICollectionView!
    var collectionArray : [Character] = []
    var searchName : String?
    var page : UInt = 0
    weak var refreshControl : UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
  
        #if DEBUG
            searchBar.text = "Captain"
            self.searchBarSearchButtonClicked(searchBar)
        #endif
        
        collectionView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "marvel_logo_bg_image"))
        
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(refresh), for: .valueChanged)
        collectionView.addSubview(control)
        self.refreshControl = control
        
        let bottomControl = UIRefreshControl()
        bottomControl.addTarget(self, action: #selector(loadNextPage), for: .valueChanged)
        bottomControl.triggerVerticalOffset = 100
        collectionView.bottomRefreshControl = bottomControl
    }
    
    func loadNextPage(){
        guard let name = searchName else{
            collectionView.bottomRefreshControl?.endRefreshing()
            return
        }
        
        page += 1
        reload(with: name)
    }
    
    func refresh(){
        guard let name = searchName else{
            refreshControl.endRefreshing()
            return
        }
        
        page = 0
        reload(with: name)
    }
    
    func reload(with name : String){
        
        func completion(_ arr : [Character]?, _ err : Error?){
            self.refreshControl.endRefreshing()
            self.collectionView.bottomRefreshControl?.endRefreshing()
            
            guard let arr = arr else{
                //TODO: toast it
                print(err?.localizedDescription ?? "unkown error")
                return
            }
            
            if self.page == 0{
                self.collectionArray = arr
            } else {
                self.collectionArray += arr
            }
            self.collectionView.reloadData()
        }
        
        let recsPerPage = UInt(collectionView.bounds.width / 100) * 7
        MarvelManager.manager.getCharacters(by: name,
                                            recsPerPage: recsPerPage,
                                            page: page,
                                            completion: completion)
        
        //MarvelManager.manager.getCharacters(by: name, completion: completion)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let charVC = segue.destination as? CharacterViewController,
            let cell = sender as? UICollectionViewCell,
            let indexPath = self.collectionView.indexPath(for: cell)
            {
                charVC.char = collectionArray[indexPath.item]
                
        }
        
    }
    
}

extension SearchViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /*
         w = 360
         c = 3
         s = 100 + (360 % 100 = 60) / 3 = 100 + 20 = 120
         */
        let w = Int(collectionView.bounds.width)
        let c = w / 100
        let s = 100 + (w % 100) / c
        
        return CGSize(width: s, height: s)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CharacterCell
        
        cell.configure(with: collectionArray[indexPath.item])
        
        return cell
        
    }
    
}

extension SearchViewController : UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        collectionArray = []
        collectionView.reloadData()
        
        searchBar.resignFirstResponder()
        
        searchName = nil
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let name = searchBar.text, !name.isEmpty else{
            return
        }
        
        page = 0
        searchName = name
        
        reload(with: name)
    }
}
















