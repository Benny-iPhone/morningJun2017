//
//  PurpleView.swift
//  ChessViewProject
//
//  Created by Benny Davidovitz on 02/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class PurpleView: UIView {

    //manual - by programmer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    //automatic - by storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        self.backgroundColor = .purple
    }

}








