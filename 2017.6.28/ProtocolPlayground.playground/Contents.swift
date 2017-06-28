//: Playground - noun: a place where people can play

import UIKit

//var arr : [Int]?
//arr?.append(3)

protocol PizzaDelegate{
    func pizza(_ pizza : Pizza, slicesLeft : Int)
}

class Pizza{
    var slices = 8
    var delegate : PizzaDelegate?
    
    func eatSlice(){
        guard slices > 0 else {
            return
        }
        slices -= 1
        
        delegate?.pizza(self, slicesLeft: slices)
    }
}

let p1 = Pizza()
p1.delegate
p1.eatSlice()
p1.slices

class Worker : /*NSObject,*/ PizzaDelegate{
    
    func pizza(_ pizza: Pizza, slicesLeft: Int) {
        print(#function)
        if slicesLeft == 2{
            makeNewPizze()
        }
    }
    
    func makeNewPizze(){
        print(#function)
    }
}

let w1 = Worker()
p1.delegate = w1
for _ in 0..<p1.slices{
    p1.eatSlice()
}















