//: Playground - noun: a place where people can play

import UIKit

enum PrintType{
    case ink
    case lazer, threeDim
    
    static let count = 3
    
    func cost() -> Double{
        switch self {
        case .ink:
            return 1.5
        case .lazer, .threeDim:
            return 0.3
        }
    }
}

let p = PrintType.ink
var p1 : PrintType = .lazer
p1.cost()
if p == .threeDim{
    
}

var p2 : PrintType?
var arr : [PrintType] = [p,p1]


enum Days : Int{
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday// = 10
    case saturday
    
    func nextDay() -> Days{
        
        //return Days(rawValue: self.rawValue + 1) ?? .sunday
        
        if let next = Days(rawValue: self.rawValue + 1){
            return next
        } else {
            return .sunday
        }
    }
    
    func prevDay() -> Days{
        if let prev = Days(rawValue: self.rawValue - 1){
            return prev
        } else {
            return .saturday
        }
    }
    
    func name() -> String{
        return String(describing: self)
    }

    func displayName() -> String{
        switch self {
        case .sunday: return "יום ראשון 💩"
        case .monday: return "יום שני"
        case .tuesday: return "יום שלישי"
        case .wednesday: return "יום רביעי"
        case .thursday: return "יום חמישי"
        case .friday: return "יום שישי"
        case .saturday: return "יום שבת 🕯🕯"
        }
    }
}

let d1 : Days = .monday
d1.nextDay()
Days.friday.nextDay().nextDay()
d1.rawValue

d1.name()

let x = Days.saturday.rawValue
let d2 : Days? = Days(rawValue: 12)

Days.sunday.displayName()
Days.saturday.displayName()
/*
let myNum : Int = 4
switch myNum {
case 0:
case 1, 2:
case 3...10:
case 11...Int.max:
    
    <#code#>
default:
    <#code#>
}*/



let now : TimeInterval = Date().timeIntervalSince1970
let date1 = Date(timeInterval: 86_400, since: Date())
Date()
let date2 = Date(timeIntervalSince1970: 130_000_000)

func weekDay(from date : Date) -> Days{
    let calendar = Calendar.current
    let weekday = calendar.component(.weekday, from: date)
    return Days(rawValue: weekday)!
    
}

weekDay(from: date2).displayName()
weekDay(from: Date())


extension Date{
    func isFriday13th() -> Bool{
        
        let calendar = Calendar.current
        let comps : DateComponents = calendar.dateComponents([.day, .weekday], from: self)
        return comps.day == 13 && comps.weekday == 6
        
    }
}

let testDate = Date(timeIntervalSince1970: 1484305834)
testDate.isFriday13th()


let cal = Calendar(identifier: .hebrew)

//dd-MM-yyyy
let formatter = DateFormatter()
//formatter.dateStyle = .medium//.full
formatter.dateFormat = "dd-MM-yyyy HH:mm"
let str : String = formatter.string(from: testDate)
let date3 : Date? = formatter.date(from: "01-04-2017 16:00")

let hebFormatter = DateFormatter()
hebFormatter.calendar = Calendar(identifier: .hebrew)
hebFormatter.locale = Locale(identifier: "he")
hebFormatter.dateStyle = .full
hebFormatter.string(from: Date(timeIntervalSince1970: 0))
let hebStr = hebFormatter.string(from: date3!)

let date4 : Date = hebFormatter.date(from: hebStr)!
date4.timeIntervalSince1970







