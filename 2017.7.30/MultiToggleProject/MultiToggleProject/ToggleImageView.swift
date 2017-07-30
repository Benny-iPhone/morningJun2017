//
//  ToggleImageView.swift
//  MultiToggleProject
//
//  Created by Benny Davidovitz on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ToggleImageView: UIImageView {

    var toggleImages : [UIImage] = []{
        didSet{
            index = 0
            refresh()
        }
    }
    var index : Int = 0

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
        isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.addGestureRecognizer(gesture)
    }
    
    func tapAction(){
        if (index + 1) >= toggleImages.count{
            index = 0
        } else {
            index += 1
        }
        
        refresh()
    }
    
    
    private func refresh(){
        guard toggleImages.count > 0 else {
            return
        }
        
        self.image = toggleImages[index]
    }

    
}














