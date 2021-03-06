//
//  Character.swift
//  MarvelProject
//
//  Created by Benny Davidovitz on 16/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class Character: NSObject {
    let id : Int64
    let name : String
    let desc : String
    let thumbnailURL : URL?
    
    init(_ dict : [String:Any]) {
        
        self.id = dict["id"] as? Int64 ?? 0
        self.name = dict["name"] as? String ?? ""
        self.desc = dict["description"] as? String ?? ""
        
        if let thumbnail = dict["thumbnail"] as? [String:Any]{
            let path = thumbnail["path"] as? String ?? ""
            let ext = thumbnail["extension"] as? String ?? ""
            
            self.thumbnailURL = URL(string: path + "." + ext)
        } else {
            self.thumbnailURL = nil
        }
        
        super.init()
        
    }
}















