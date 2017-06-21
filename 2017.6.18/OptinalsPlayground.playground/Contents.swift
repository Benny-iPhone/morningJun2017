//: Playground - noun: a place where people can play

import UIKit
/*
 var str = "123a"
 var num : Int? = Int(str)
 
 func findIndex(_ arr : [Int], value : Int) -> Int?{
 for i in 0..<arr.count{
 if arr[i] == value{
 return i
 }
 }
 
 return nil
 }
 
 num = findIndex([1,2,3,4], value: 4)
 if num != nil{
 num! += 1
 }
 
 var b : Bool? = false
 
 if !b!{
 print(b!)
 }
 */
var arr : [Int] = [1,2,3]
if let first = arr.first{
    print(first)
}

if let num1 = Int("45d"){
    print(num1)
} else {
    print("asmdlkasdn")
}

var num = Int("3")
//print(num)
if var num = num, num > 0{
    num += 1
}

func sumArr(_ arr : [Int]?) -> Int?{
    if let arr = arr {
        var sum = 0
        for num in arr{
            sum += num
        }
        return sum
    } else {
        return nil
    }
}

sumArr([-1,1])
sumArr(nil)

func sumArr2(_ arr : [Int]?) -> Int?{
    
    guard let arr = arr else {
        return nil
    }
    
    var sum = 0
    for num in arr{
        sum += num
    }
    return sum
}

sumArr2([-1,1])


var myArr : [Int]?


myArr?.append(4)
if let first = myArr?.first{
    
}

let count = myArr?.count ?? 0
let myStr = "abc"
let myNum = Int(myStr) ?? 0
//let myNum = Int(myStr) == nil ? 0 : Int(myStr)!

var b = 1 > 2

func validateSmsCode1(_ str : String?) -> Bool{
    if str != nil{
        return str!.characters.count == 4
    } else {
        return false
    }
}

func validateSmsCode2(_ str : String?) -> Bool{
    if let str = str, str.characters.count == 4{
        return true
    } else {
        return false
    }
}

func validateSmsCode3(_ str : String?) -> Bool{
    guard let str = str else {
        return false
    }
    
    return str.characters.count == 4
}

let strArr : [String] = []
validateSmsCode3("12345")
validateSmsCode3(nil)
validateSmsCode3(strArr.first)

func validateSmsCode4(_ str : String?) -> Bool{
    return (str ?? "").characters.count == 4
    return (str?.characters.count == 4) ?? false
    return (str?.characters.count ?? 0) == 4
    return str?.characters.count == 4
}


















