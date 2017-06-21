//: Playground - noun: a place where people can play

import UIKit

//Designated Initializer

//Convenience Initializer

class Car{
    var wheels : Int
    init(wheels : Int) {
        self.wheels = wheels
        
        start()

    }
    
    convenience init() {
        self.init(wheels: 4)
    }
    
    func start(){
        
    }
}
let c1 = Car(wheels: 3)
c1.wheels
let c2 = Car()
c2.wheels

class SportCar : Car{
    var spoiler : Bool
    
    override init(wheels: Int) {
        spoiler = true
        super.init(wheels: wheels)
    }
}



let color = UIColor(red: 240/255.0, green: 130/255.0, blue: 10/255.0, alpha: 1)

UIColor.red

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

let c22 = UIColor(red: 130, green: 120, blue: 10)
let c3 = UIColor(rgb: 0xffa0b3)


















