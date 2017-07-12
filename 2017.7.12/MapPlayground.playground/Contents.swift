//: Playground - noun: a place where people can play

import UIKit

let arr = [1,2,3,-1,-2,-3]

arr.flatMap { $0 > 0 ? $0 : nil }

let result = arr.flatMap { (num : Int) -> Int? in
    if num > 0{
        return num
    } else {
        return nil
    }
}

let strs = ["a","1","-1","0.1"]
let r1 = strs.flatMap( { Int($0) })
r1


let r2 = strs.flatMap { Int($0) }
r2
//strs.flatMap(<#T##transform: (String) throws -> ElementOfResult?##(String) throws -> ElementOfResult?#>)

/*let positives = arr.map { (num : Int) -> Int in
    if num > 0{
        return num
    }
}*/
