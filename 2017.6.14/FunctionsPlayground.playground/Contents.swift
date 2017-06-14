//: Playground - noun: a place where people can play

import UIKit
/*
func doNothing(){
    
}

doNothing()

func doSomething(){
    print("doing something")
}

doSomething()


arc4random_uniform(10) //0...9

func rollDice() -> Int{
    return Int(arc4random_uniform(6)) + 1
}

rollDice()

func simonSaid(word : String){
    print("Simon said: " + word)
}

simonSaid(word: "jump")

func simonSaid2(word w : String){
    print("Simon said: " + w)
}

simonSaid2(word: "jump")

func simonSaid3(_ word : String){
    print("Simon said: " + word)
    
    for ch in word.characters{
        print(ch)
    }
}

var str = "hi"
let startIndex = str.startIndex
str.remove(at: startIndex)

simonSaid3("jump")

let s1 = "heLLo"
s1.uppercased()
s1.lowercased()

func countVocals(_ word : String) -> Int{
    //word.lowercased()
    //word.uppercased()
    let arr : [Character] = ["a","e","i","o","u"]
    
    var counter = 0
    for ch in word.lowercased().characters{
        if arr.contains(ch){
            counter += 1
        }
        //if ch == "a" ||
        
//        switch ch {
//        case "a","e","i":
//            count += 1
//        default:
//            break
//        }
    }
    
    return counter
}

func fibo(_ i : Int) -> Int{
    switch i {
    case 0:
        return 0
    case 1:
        return 1
    default:
        return fibo(i - 2) + fibo(i - 1)
    }
}

fibo(3)
/*
 fibo(3) = fibo(2) + fibo(1)
 = fibo(1) + fibo(0) + 1
 = 1 + 0 + 1
 */


func countOccurences(num : Int, x : Int) -> Int{
    
    if num < x{
        return 0
    }
    
    return  1 + countOccurences(num: num-x, x: x)
    
}


//f(27,13) = 1 + f(14,13) = 1 + 1+ f(1,13) = 1 + 1+ 0

func isPolindrom(_ arr : [Int]) -> Bool{
    let count = arr.count
    if count == 0 || count == 1{
        return true
    }
    var arr = arr
    let first = arr.removeFirst()
    let last = arr.removeLast()
    
    if first != last{
        return false
    }
    
    return isPolindrom(arr)
}

isPolindrom([1,2,3,2,1])

var num1 = 2
func changeNum(_ n : inout Int){
    n = 3
}

changeNum(&num1)


num1


func mySwap(_ a : inout Int, _ b : inout Int){
    a = a + b
    b = a - b
    a = a - b
}

var aa = 3
var bb = 5
mySwap(&aa, &bb)
aa
bb



func myFunc1(){
    let x = 55
    func myFunc2(){
        
    }
    
    
    myFunc2()
    
}

var myArr = [9,0,19]

func mySortFunc(_ a : Int, _ b : Int) -> Bool{
    return a > b
}

let f = mySortFunc

myArr.sort(by: mySortFunc)


let otherArray = myArr.sorted(by: <)
myArr.sort(by: >)

func timerFunc(_ t : Timer){
    //move line
    print(#function)
}

Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: timerFunc)
*/

func callFunc(_ f : () -> Void){
    f()
}

func makeBoolFunc(_ a : Bool, _ b : Bool, f : (Bool,Bool)->Bool) -> Bool{
    
    return f(a,b)
    
}

let t = ("13",4.56)
t.0
t.1

let t2 = (name: "king", value: 13, type: "spade")

t2.type
t2.1

func floorAndCeil(_ of : Double) -> (Int,Int,Double){
    return (1,2,M_PI)
}

let t3 = floorAndCeil(4)
t3

let str = "abc def"
str.components(separatedBy: " ")


func maxValueIn(array : [Int]) -> Int{
    if array.isEmpty{
        print("empty array")
        return -1
    }
    var m = array[0]
    for i in 1..<array.count{
        m = max(m, array[i])
    }
    
    return m
}

maxValueIn(array: [1,2,-3,-15])
let myArra = [12,-90]
maxValueIn(array: myArra)










