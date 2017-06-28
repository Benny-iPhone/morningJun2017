//: Playground - noun: a place where people can play

import UIKit

/*
 A Dictionary to represent a person data
 firstname, lastname, middlename (optional), birthdate (timestamp), gender (bool) //false = male
 */


//let dict : Dictionary<String,Any>
let dict : [String:Any] = [
    "firstname":"Aviv",
    "lastname":"Cohen",
    "birthdate":702909559.0,
    "gender":false
]

/*
 Create a class (Person) to represent the data
 Then, add a support init method
 */

class Person{
    var firstname : String
    var lastname : String
    var middleName : String?
    let birthdate : Date
    var gender : Bool
    /*
    var fullname : String{
        get{
            
        }
    }
    
    var age : Int{
        get{
            
        }
    }
    
    var canVote : Bool{
        get{
            
        }
    }*/
    
    init(_ dict : [String:Any]) {
        self.firstname = dict["firstname"] as? String ?? ""
        self.lastname = dict["lastname"] as? String ?? ""
        self.middleName = dict["middlename"] as? String
        
        let timestamp = dict["birthdate"] as? TimeInterval ?? 0 //Double
        self.birthdate = Date(timeIntervalSince1970: timestamp)
        
        self.gender = dict["gender"] as? Bool ?? false
    }
}

let p = Person(dict)
p.birthdate
p.firstname
p.middleName
p.gender
p.lastname




/*
struct Point{
    var x : Double
    var y : Double
    
    mutating func up(){
        y += 1
    }
}

var p1 = Point(x: 4, y: 4)
p1.up()
*/















