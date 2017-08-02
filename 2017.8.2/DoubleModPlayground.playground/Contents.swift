//: Playground - noun: a place where people can play

import UIKit

var num = 5
num -= num % 3

var num1 : Double = 1.5
num1.truncatingRemainder(dividingBy: 1)
num1 -= num1.truncatingRemainder(dividingBy: 1)

var num2 = 3.14
num2.formTruncatingRemainder(dividingBy: 1)
num2