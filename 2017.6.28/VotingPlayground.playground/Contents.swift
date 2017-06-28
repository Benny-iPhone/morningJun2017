//: Playground - noun: a place where people can play

import UIKit

//var str : String? = ""
//if middleName != nil && !(middleName!.isEmpty){
//    arr.append(middleName!)
//}

class Person{
    let firstName : String
    let lastName : String
    let middleName : String?
    let birthDate : Date
    
    var fullName : String{
        get{
            var arr : [String] = []
            
            if firstName.isEmpty == false{
                arr.append(firstName)
            }
            
            if let middleName = middleName, !middleName.isEmpty{
                arr.append(middleName)
            }
            
            if lastName.isEmpty == false{
                arr.append(lastName)
            }
            
            return arr.joined(separator: " ")
        }
    }
    
    var age : Int{
        get{
            return age(using: .current)
        }
    }
    
    var canVote : Bool{
        get{
            if age(using: Calendar(identifier: .hebrew)) >= 18{
                return true
            }
            
            if age(using: Calendar(identifier: .gregorian)) >= 18 {
                return true
            }
            
            return false
        }
    }
    
    private func age(using calendar : Calendar) -> Int{
        let now = Date()
        let comps : DateComponents = calendar.dateComponents([.year], from: self.birthDate, to: now)
        
        return abs(comps.year ?? 0)
    }
    
    init(_ dict : [String:Any]) {
        self.firstName = dict["first_name"] as? String ?? ""
        self.lastName = dict["last_name"] as? String ?? ""
        self.middleName = dict["middle_name"] as? String
        let timestamp = dict["birthdate"] as? TimeInterval ?? 0
        self.birthDate = Date(timeIntervalSince1970: timestamp)
    }
    
    
}

let dict : [String:Any] = [
    "first_name":"John",
    "last_name":"Snow",
    "middle_name":"u no nothing",
    "birthdate":930553701.026924
]

let bastard = Person(dict)
bastard.birthDate

bastard.fullName
bastard.age
bastard.canVote

let gregCal = Calendar(identifier: .gregorian)
let testDate = gregCal.date(byAdding: .year, value: -18, to: Date())
let formatter = DateFormatter()
formatter.calendar = Calendar(identifier: .hebrew)
formatter.dateStyle = .medium
formatter.string(from: testDate!)

testDate?.timeIntervalSince1970




























