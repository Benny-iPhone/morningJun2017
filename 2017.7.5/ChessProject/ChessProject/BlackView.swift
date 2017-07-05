//
//  BlackView.swift
//  ChessProject
//
//  Created by Benny Davidovitz on 05/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit



@IBDesignable class BlackView: UIView {

    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup(){
        self.backgroundColor = .black
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setup()
    }


}








