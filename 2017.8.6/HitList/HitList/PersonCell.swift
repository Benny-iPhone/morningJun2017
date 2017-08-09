//
//  PersonCell.swift
//  HitList
//
//  Created by Benny Davidovitz on 06/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

extension Date{
    var string : String{
        get{
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .medium
            
            formatter.doesRelativeDateFormatting = true
            
            return formatter.string(from: self)
        }
    }
}

class PersonCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    func configure(with person : Person){
        nameLabel.text = person.name
        dateLabel.text = person.date.string
    }

}
















