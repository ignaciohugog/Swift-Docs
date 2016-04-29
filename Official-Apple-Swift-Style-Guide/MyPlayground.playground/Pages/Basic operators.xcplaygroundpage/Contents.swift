//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/*
===   and !==
*/

struct MyStruct {
	var a:Int
	var b:Int
	var c:Int?
	init() {
		a=1; b=2;
		c = c ?? 3 //c = c != nil ? c! : 3
	}
}

let structA = MyStruct()
let structB = MyStruct()

class MiClass: NSObject {
	var a = 1
	var b = 1
}

let classA = MiClass()
let classB = MiClass()
let classC = classA
classC.a = 2
let test = classA.a
test


classA === classC



"bd"<"bc"

/*
Nil coalescing operator (a ?? b)
unwraps an optional a if it contains a value, or returns a default value b if a is nil
*/

structA.c //use a nil coalescing operator

/*
Strings can append characters:
*/
var a:Character = "a"
var s = "hol"
s.append(a)

/*
Strings can append characters:
*/

let multiplier = 3

let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5”

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.endIndex.predecessor()]
// !
greeting[greeting.startIndex.successor()]
// u
let index = greeting.startIndex.advancedBy(7)
greeting[index]
// a


greeting.hasPrefix("Gut")
greeting.hasSuffix("g!")















