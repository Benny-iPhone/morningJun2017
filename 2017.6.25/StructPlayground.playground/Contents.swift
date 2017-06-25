//: Playground - noun: a place where people can play

import UIKit

struct Point{
    var x : Double = 0
    var y : Double = 0
    
    func distance(from p : Point) -> Double{
        return sqrt(pow(self.x - p.x, 2) + pow(self.y - p.y, 2))
        
    }
}

var p1 = Point(x: 3, y: 3)
let p2 = Point()
p2.x
p1.x = 3
p1.y = 4

p2.distance(from: p1)

class Person{
    var name : String = ""
}

var arr1 = [Person()]
arr1[0].name = "a"
var arr2 = arr1
arr2.append(Person())
arr2[0].name = "b"
arr1[0].name

arr1
/*

let per1 = Person()
per1.name = "a"
//p2.x = 4


var point1 = Point(x: 4, y: 4)
var point2 = point1
point2.x = 5

var reuven1 = Person()
reuven1.name = "reuven"
var reuven2 = reuven1
reuven2.name = "shimon"

point1.x
reuven.name


let label1 = UILabel()
var rect : CGRect = label1.frame
rect.origin.y += 40
let label2 = UILabel(frame: rect)


*/





