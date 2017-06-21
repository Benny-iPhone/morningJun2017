//: Playground - noun: a place where people can play

import UIKit


extension String{
    
    func isPolindrom(_ insensative : Bool = false) -> Bool{
        let count = self.characters.count
        if count == 1 || count == 0{
            return true
        }
        
        var str = self
        if insensative{
            str = self.lowercased()
        }
        
        if str.characters.first != str.characters.last{
            return false
        }
        
        str.characters.removeFirst()
        str.characters.removeLast()
        
        
        return str.isPolindrom()
    }
}


let myStr = "   "
myStr.isPolindrom(true)

func checkPolindromQuantity(_ str : String) -> Int{
    var sum = 0
    
    let arr = str.components(separatedBy: " ")
    for word in arr {
        if word.isPolindrom(true) && word.isEmpty == false{
            sum += 1
        }
    }
    
    return sum
}


var str = "Aba 121 Ima " + "אבא" + "    " + "😍x😍"
checkPolindromQuantity(str)




let tesTSTR = "a,2,3$4"

let charSet = CharacterSet(charactersIn: ",$")
tesTSTR.components(separatedBy: charSet)


func fibo(_ i : Int) -> UInt64{
    var n1 : UInt64 = 0
    var n2 : UInt64 = 1
    if i == 0{
        return n1
    }
    if i == 1{
        return n2
    }
    
    for _ in 2...i{
        let sum = n1 + n2
        n1 = n2
        n2 = sum
    }
    
    return n2
}


fibo(90)



func splitArray(_ arr : [Int]) -> (negatives : [Int], rest : [Int]){
    
    var negativesArr : [Int] = []
    var restArr = [Int]()
//    var t : (negatives : [Int], rest : [Int]) = ([],[])
    
    for num in arr{
        if num < 0{
            negativesArr.append(num)
        } else {
            restArr.append(num)
        }
    }
    
    negativesArr.sort { (n1, n2) -> Bool in
        return n1 < n2
    }
    restArr.sort()
    return (negativesArr,restArr)
    
    //return (negativesArr.sorted(),restArr.sorted())
    
}

let t = splitArray([-2,-3,4,1])
t.negatives
t.rest
t.0
t.1






















