//
//  ChessView.swift
//  ChessProject
//
//  Created by Benny Davidovitz on 05/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
/*
class TileView : UIView{

    enum Color {
        case black
        case white
        
        func color() -> UIColor{
            switch self {
            case .black: return .blue
            case .white: return .yellow
            }
        }
    }
    
    var isBlack : Bool{
        get{
            return self.backgroundColor == Color.black.color()
        }
    }
    
    init(frame: CGRect, color : Color) {
        super.init(frame: frame)
        
        self.backgroundColor = color.color()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}*/

@IBDesignable class ChessView: UIView {

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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setup()
    }
    
    private func setup(){
        //cleanup
        
        for item in self.subviews{
            if item is BlackView || item is WhiteView{
                item.removeFromSuperview()
            }
        }
        
        //create chess
        let tileSize = min(self.bounds.width, self.bounds.height) / 8
        
        var rect = CGRect(x: 0, y: 0, width: tileSize, height: tileSize)
        
        for row in 0..<8{
            for col in 0..<8{
                //create new subview
                if (col + row) % 2 == 0{
                    //black
                    self.addSubview(BlackView(frame: rect))
                } else {
                    //white
                    self.addSubview(WhiteView(frame: rect))
                }
                //increment x
                rect.origin.x += tileSize
            }
            
            //zero x
            rect.origin.x = 0
            //increment y
            rect.origin.y += tileSize
            
        }
    }


}
















