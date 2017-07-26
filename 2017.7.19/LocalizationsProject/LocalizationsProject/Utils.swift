//
//  Utils.swift
//  LocalizationsProject
//
//  Created by Benny Davidovitz on 19/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import Foundation

extension String{
    var localizedString : String{
        get{
            return NSLocalizedString(self, comment: self)
        }
    }
}

func isRTL() -> Bool{
    let code = Locale.current.languageCode ?? "en"
    return Locale.characterDirection(forLanguage: code) == .rightToLeft
}



















