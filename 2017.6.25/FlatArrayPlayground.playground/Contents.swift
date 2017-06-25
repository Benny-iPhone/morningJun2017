//: Playground - noun: a place where people can play

import UIKit

func flatArray(_ arr : [Any]) -> [Any]{
    var result : [Any] = []
    for item in arr{
        if let tempArr = item as? [Any]{
            let t1 = flatArray(tempArr)
            print(t1)
            result += t1
        }else{
            result.append(item)
        }
    }
    return result
}

flatArray([[6],7])
flatArray([1,[2,2],3])
//flatArray([1,2,3,[4,[[[[5]]]]]])

/*
flatArray([3,4])
flatArray([1,2,[3,4]])
flatArray([7,[1,2,3,[4,[5]],[[[6],7]],"[abc]"]])
*/
var arr1 : [Int] = [1,2,3]
arr1.append(4)
arr1 += [6,7,8]
