//: Playground - noun: a place where people can play

import UIKit

extension Int{
    func contains(_ d : Int) -> Bool{
        var num = self
        while num > 0{
            if num % 10 == d{
                return true
            }
            
            num = num / 10
        }
        
        return false
    }
}

14.contains(4)



func checkBoom(_ num : Int,digit d : Int) -> Bool{
    
    var num = num
    while num > 0{
        if num % 10 == d{
            return true
        }
        
        num = num / 10
    }
    
    return false
    
}

checkBoom(167887, digit: 9)

var sum = 0
for var n in 1...999{
    
    if n % 7 == 0{
        sum += 1
        continue
    }
    
    if n.contains(7){
        sum += 1
        continue
    }
    
    /*
    if checkBoom(n, digit: 7){
        sum += 1
        continue
    }
    */
    /*
    while n > 0{
        if n % 10 == 7{
            sum += 1
            n = 0
        }
        
        n = n / 10
    }
    */
    
/*
    if n % 10 == 7{
        sum += 1
        continue
    }
    
    if (n / 10) % 10 == 7{
        sum += 1
        continue
    }*/
}

sum






















