//: Playground - noun: a place where people can play

import UIKit

var _ages : [String:Int] = [:]
var ages : Dictionary<String,Int> = [
    "benny":30,
    "sapir":21,
    "leah":18
]

ages["tzvi"] = 24

let bennys = ages["benny"]
ages["benny"] = 17
let el = ages["el"]

ages

ages.removeValue(forKey: "benny")
ages["tzvi"] = nil

ages
ages.updateValue(22, forKey: "sapir")

ages


let allKeys = Array(ages.keys)
let allValues = Array(ages.values)

for (key,val) in ages{
    print(key + " is \(val) years old")
}

for t in ages{
    //t.key
    //t.value
}

let t1 = (upper : 14, lower : 13)
t1.upper
t1.0

func countB(_ dict : [String:String]) -> Int{
    var sum = 0

    for (key,val) in dict{
        let str = key+val
        for ch in str.characters{
            if ch == "b" || ch == "B"{
                sum += 1
            }
        }
    }
    
    return sum
}

let sampleDict : [String:String] = [
    "birst_name":"benny",
    "last_name":"Berkovitz",
    "city":"Bnei Brak",
    "b_date":"13th feb 1990"
]
countB(sampleDict)






















