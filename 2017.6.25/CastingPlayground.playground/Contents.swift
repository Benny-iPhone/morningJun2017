//: Playground - noun: a place where people can play

import UIKit
/*
let arr : [Any] = [1,3.14,"hello"]
let obj = arr[0]

var num = 1
//num += obj

let d = arr[1] as? Double
var num1 : Double = 1.0

if let d1 = arr[2] as? Double{
    num1 += d1
} else {
    print("not double")
}

if obj is Int{
    print("first object is Int")
    num += obj as! Int
}

//Double("4")

func sumNumber(_ arr : [Any]) -> Double{
    var sum : Double = 0
    
    for item in arr{
        if let num = item as? Int{
            sum += Double(num)
        } else if let num = item as? Double{
            sum += num
        } else if let str = item as? String,
            let num = Double(str){
            sum += num
        }
    }
    
    return sum
}

sumNumber([1,2,4.5,"hello","3.14",CGPoint.zero,"-10"])

Int("ff",radix:16)
*/
let testArr : [Any] = ["-50",-400,-1.5,7,"minus 1_000_000","-ff",[1,2,300]]


extension Double{
    init?(_ obj : Any){
        if let d = obj as? Double{
            self = d
        } else if let n = obj as? Int{
            self = Double(n)
        } else if let str = obj as? String,
            let d = Double(str){
            self = d
        } else {
            return nil
        }
    }
}

let first = testArr[0]
let d1 = Double(first)


func maxInArray(_ arr : [Any]) -> Double?{
    var maxVal : Double? = nil
    
    for item in arr{
        guard let dVal = Double(item) else{
            continue //next item
        }
        
        if maxVal == nil || maxVal! < dVal{
            maxVal = dVal
        }
    }
    
    return maxVal
}

maxInArray([NSNull(),"a","3",4.5,2,-7])
maxInArray([])














