//: Playground - noun: a place where people can play

import UIKit

class MyClass{
    var str = ""
    var str1 : String = ""
    var str2 : String?
    
    func doSomething(){
        
    }
    
    func returnSomething() -> Int{
        return 1
    }
}

class MySubClass : MyClass{
    override func returnSomething() -> Int {
        return super.returnSomething() + 1
    }
}

let obj1 = MyClass()
obj1.str
obj1.str = "aaa"
obj1.str

let obj2 = MySubClass()
obj2.str1

obj1.doSomething()
obj2.returnSomething()


class Person {
    var name : String
    
    init() {
        name = "John Doe"
    }
 
    init(_ name : String/* = "John Doe"*/) {
        self.name = name
    }
}

let p = Person()
p.name
let p1 = Person("A B")
//let p2 = Person(<#T##name: String##String#>)


/*
 Create class Child, with 2 properties, first name & last name
 add a method to return the full name
 
 */

extension Date{
    func yearsTo(_ date : Date) -> Int{
        return Calendar.current.dateComponents([.year], from: self, to: date).year ?? 0
    }
}

class Child : NSObject{
    var firstName : String
    var lastName : String
    let birthDate : Date
    var age : Int{
        get{
            let now = Date()
            return birthDate.yearsTo(now)
        }
    }
    var fullName : String{
        get{
            return firstName + " " + lastName
        }
        set (newFullname){
            //newValue
            
            let arr = newFullname.components(separatedBy: " ")
            guard arr.count == 2 else {
                return
            }
            self.firstName = arr[0]
            self.lastName = arr[1]
        }
    }
    init(firstName : String, lastName : String, birthDate : Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        
        super.init()
    }
    /*
    func fullName() -> String{
        return firstName + " " + lastName
    }*/
}

let date = Date(timeIntervalSince1970: 123_456_789)
//let c = Child(firstName: "Aviv", lastName: "Cohen")
let c = Child(firstName: "Aviv2", lastName: "Cohen", birthDate: date)
c.fullName
c.age
c.fullName = "aa bb"
c.firstName



extension String{
    var isValidCode : Bool{
        get{
            return self.characters.count == 4
        }
    }
    
    func isValidCode2() -> Bool{
        return self.characters.count == 4
    }
}

let myStr = "123"
myStr.isValidCode










