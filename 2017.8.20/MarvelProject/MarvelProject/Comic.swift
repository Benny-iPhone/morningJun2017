//
//  Comic.swift
//  MarvelProject
//
//  Created by Benny Davidovitz on 20/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class Comic: NSObject {
    let id : Int
    let digitalId : Int
    let title : String?
    let purchaseUrl : URL?
    
    init?(_ dict : MarvelManager.JSON){
        guard let id = dict["id"] as? Int,
            let digitalId = dict["digitalId"] as? Int else{
                return nil
        }
        
        self.id = id
        self.digitalId = digitalId
        
        self.title = dict["title"] as? String
        
        let urls = dict["urls"] as? [MarvelManager.JSON] ?? []
        //returns many
        //urls.filter(<#T##isIncluded: ([String : Any]) throws -> Bool##([String : Any]) throws -> Bool#>)
        
        //returns one
        //urls.first(where: <#T##([String : Any]) throws -> Bool#>)
        let pDictionary = urls.first { $0["type"] as? String == "purchase"}
        if let str = pDictionary?["url"] as? String{
            self.purchaseUrl = URL(string: str)
        } else {
            self.purchaseUrl = nil
        }
        
        /*
        self.purchaseUrl = urls.flatMap {
            guard let str = $0["type"] as? String,
                str == "purchase",
                let url = $0["url"] as? String
            else{
                return nil
            }
            
            return URL(string: url)
        }.first
        */
        
        
        /*
        self.purchaseUrl = urls.filter({ $0["type"] as? String == "purchase"}).flatMap {
            URL(string: $0["url"] as? String ?? "")
        }.first
 */
    }
}














