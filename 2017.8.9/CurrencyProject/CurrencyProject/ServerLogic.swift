//
//  ServerLogic.swift
//  CurrencyProject
//
//  Created by Benny Davidovitz on 09/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import Alamofire

class ServerLogic: NSObject {
    static let shared = ServerLogic()
    
    let baseURL = "https://api.fixer.io/latest"
    
    typealias Completion = ([Currency],String) -> Void
    
    func getCurrencies(with base : String, _ completion : @escaping Completion){
        
        Alamofire.request(baseURL, method: .get, parameters: ["base":base]).responseJSON {
            
            guard let result = $0.result.value as? [String:Any] else{
                completion([],"")
                return
            }
            
            let date = result["date"] as? String ?? ""
            let rates = result["rates"] as? [String:Double] ?? [:]
            let arr = rates.flatMap({
                Currency(code: $0.key, value: $0.value)
            })
            
            completion(arr,date)
            
        }
        
    }
}
















