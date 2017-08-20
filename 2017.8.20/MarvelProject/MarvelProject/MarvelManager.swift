//
//  MarvelManager.swift
//  MarvelProject
//
//  Created by Benny Davidovitz on 16/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CryptoSwift
import Alamofire

class MarvelManager: NSObject {
    
    static let manager = MarvelManager()
    
    private let baseURL = "https://gateway.marvel.com/v1/public/"
    private let privateKey = "b8fcab014172804adbe7c54f98068c0ec20eb6a5"
    private let publicKey = "aafca0489da97492acc924be7026a3f3"

    private func defaultParams() -> JSON
    {
        //hash string - timestamp + private + public
        let timestamp = Int(Date().timeIntervalSince1970)
        let hashString = "\(timestamp)" + privateKey + publicKey
        let md5String = hashString.md5()
        
        return [
            "hash":md5String,
            "apikey":publicKey,
            "ts":timestamp
        ]
    }
    
    //typealias Matrix = [[Int]]
    typealias JSON = [String:Any]
    typealias DictionaryResultCompletion = ([JSON]?,Error?) -> Void
    
    private func sendGetRequest(endpoint : String,
                                params : JSON,
                                completion : @escaping DictionaryResultCompletion)
    {
        let url = baseURL + endpoint
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (dataRes) in
            
            guard let json = dataRes.result.value as? JSON else{
                //noify about an error
                completion(nil, dataRes.error)
                return
            }
            
            guard let code = json["code"] as? Int else{
                return
            }
            
            guard code >= 200 && code <= 299 else{
                //http error
                let status = json["status"] as? String ?? ""
                let err = NSError(domain: "marvel", code: code, userInfo: [
                    NSLocalizedDescriptionKey:status
                    ])
                completion(nil, err as Error)
                return
            }
            
            let data = json["data"] as? JSON ?? [:]
            let jsonArr = data["results"] as? [JSON] ?? []
            
            completion(jsonArr, nil)
            
        }
    }
    
    func getCharacters(by name : String,
                       recsPerPage : UInt, //bigger than 0
                       page : UInt, //0 or bigger
                       completion : @escaping ([Character]?,Error?)->Void)
    {
     
        var params = defaultParams()
        params["nameStartsWith"] = name
        params["limit"] = recsPerPage
        params["offset"] = recsPerPage * page
        
        sendGetRequest(endpoint: "characters", params: params) { (jsonArr, err) in
            let arr = jsonArr?.flatMap{ Character($0)}
            completion(arr,err)
        }
        
        
    }
    
    func getComicsFor(charID : String,
                      completion : @escaping ([Comic]?, Error?) -> Void)
    {
        let endpoint = "characters/" + charID + "/comics"
        let params = self.defaultParams()
        
        sendGetRequest(endpoint: endpoint, params: params) { (jsonArr, err) in
            
            let arr = jsonArr?.flatMap { Comic($0) }
            completion(arr,err)
            
        }
    }
    
}

















