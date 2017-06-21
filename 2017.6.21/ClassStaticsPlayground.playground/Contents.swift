//: Playground - noun: a place where people can play

import UIKit

class AirPlane{
    static let maxHeight : Double = 1_000
    
    var height : Double = 0
    
    class func fleet() -> [AirPlane]{
        return [AirPlane(),AirPlane()]
    }
}

let arr = AirPlane.fleet()
AirPlane.maxHeight

enum Direction{
    case left, right
    case up, down
    
    static let count : Int = 4
}

class AppManager{
    static let manager = AppManager()
    
    var num = 0
    func doSomething(){
        num += 1
    }
}

AppManager.manager.doSomething()
AppManager.manager.num
//AppManager().num

class DBManager{
    private static var _manager : DBManager?
    static var manager : DBManager{
        get{
            if _manager == nil {
                _manager = DBManager()
            }
            
            return _manager!
        }
    }
    
    init?() {
        guard DBManager._manager == nil else{
            return nil
        }
        
    }
    
    func save() -> Bool{
        return true
    }
}

DBManager.manager.save()
let m1 = DBManager()
m1
UIColor.red
/*
class SubDBManager : DBManager{
    //override static let manager = SubDBManager()
}*/



















