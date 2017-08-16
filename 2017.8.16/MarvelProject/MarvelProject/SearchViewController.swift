//
//  SearchViewController.swift
//  MarvelProject
//
//  Created by Benny Davidovitz on 16/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var collectionView : UICollectionView!
    var collectionArray : [Character] = []

    func reload(with name : String){
        
        func completion(_ arr : [Character]?, _ err : Error?){
            guard let arr = arr else{
                //TODO: toast it
                print(err?.localizedDescription ?? "unkown error")
                return
            }
            
            self.collectionArray = arr
            self.collectionView.reloadData()
        }
        
        MarvelManager.manager.getCharacters(by: name, completion: completion)
    }
    
}

extension SearchViewController : UICollectionViewDataSource{
    
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
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let name = searchBar.text, !name.isEmpty else{
            return
        }
        
        reload(with: name)
    }
}
















