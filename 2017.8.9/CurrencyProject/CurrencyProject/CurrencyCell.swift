//
//  CurrencyCell.swift
//  CurrencyProject
//
//  Created by Benny Davidovitz on 09/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {

    @IBOutlet weak var flagImageView: UIImageView!
    
    @IBOutlet weak var codeLabel: UILabel!

    @IBOutlet weak var valueLabel: UILabel!
    
    func configure(with currency : Currency){
        
        codeLabel.text = currency.code
        valueLabel.text = currency.value.description
        flagImageView.image = currency.image
        
    }
    
    
}












