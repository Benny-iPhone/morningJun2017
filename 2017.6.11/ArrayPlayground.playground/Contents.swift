//: Playground - noun: a place where people can play

import UIKit

var arr1 : Array<Int> = [1,2,3]
let arr2 : [Int] = [1,2,3]
let arr3 = [1,2,3]
let arr4 : [Any] = [1,2,"str",3.4]

if arr4[1] is Int{
    
}
arr1[2]
//arr1 +=  arr2
arr1 += [4,5,6]


arr1[0] = 9
arr1

arr1.count

arr1.append(20)

arr1.insert(7, at: 2)

arr1.count

arr1.remove(at: 2)
//arr1 = []

arr1
arr1[0...2] = [0]
arr1
arr1[0...0] = [1,1,1,1]
arr1

var sum = 0
for num in arr1{
    sum += num
}

sum

for (index,val) in arr1.enumerated(){
    index
}


for i in 0..<arr1.count{
    let num = arr1[i]
}

for i in stride(from: 0, to: arr1.count, by: 3){
    
    print(i)
    
}

let arr5 = [Int](repeatElement(0, count: 30))

let a = 5
let b = 11
let c = 2

let d = (a % c == 0) ? 1 : 0
let r = b/c - a/c + d
/*

for n in 1...100{
    if n % 7 == 0 {
        continue
    }
    
    
    asd
    
    asdasd
}


*/








