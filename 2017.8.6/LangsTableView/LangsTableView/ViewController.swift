//
//  ViewController.swift
//  LangsTableView
//
//  Created by Benny Davidovitz on 06/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    let tableArray : [String]
    var selectionSet : Set<String> = []
    
    required init?(coder aDecoder: NSCoder) {
        
        let hebLang = Locale(identifier: "he")
        let arr = Locale.availableIdentifiers.flatMap {
            hebLang.localizedString(forLanguageCode: $0)
        }
        
        tableArray = Array(Set(arr)).sorted()
        
        super.init(coder: aDecoder)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let name = tableArray[indexPath.row]
        cell.textLabel?.text = name
        
        if selectionSet.contains(name){
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let name = tableArray[indexPath.row]
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if selectionSet.contains(name){
            selectionSet.remove(name)
            cell?.accessoryType = .none
        } else {
            
            if selectionSet.count >= 5{
                
                let alert = UIAlertController(title: "error", message: "you can not choose more than 5 langs", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            } else {
            
                selectionSet.insert(name)
                cell?.accessoryType = .checkmark
            }
        }
        
        //tableView.reloadRows(at: [indexPath], with: .automatic)
        
        
        //print(tableArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    


}







