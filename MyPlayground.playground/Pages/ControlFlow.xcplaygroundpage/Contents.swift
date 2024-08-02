//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/*
while
*/

let arr = [1,2,3,3,3,4,5,5,6,6,7,7,8,87,654,32,3,454,3]
var B = 0
var i = 0

//while i>=0 {
//	i-=1
//	B = arr[i]
//}
//B

//in order to avoid out of bound error use repeat:

repeat {
	B = arr[i]
	i-=1
} while i>=0

/*
switch
*/

//matching many values in case
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
	print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
	print("\(someCharacter) is a consonant")
default:
	print("\(someCharacter) is not a vowel or a consonant")
}

//compute all cases with fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
	description += " a prime number, and also"
	fallthrough
default:
	description += " an integer."
}

//using tuples
let somePoint = (0, 0)
switch somePoint {
case (0, 0):
	print("(0, 0) is at the origin")
case (_, 0):
	print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
	print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
	print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
	print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

//value bindings
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
	print("on the x-axis with an x value of \(x)")
case (0, let y):
	print("on the y-axis with a y value of \(y)")
case let (x, y):
	print("somewhere else at (\(x), \(y))")
}

//using where
let yetAnotherPoint = (1, 1)
switch yetAnotherPoint {
case let (x, y) where x == y:
	print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
	print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
	print("(\(x), \(y)) is just some arbitrary point")
}

//labeled statements

infinity: while true {
	switch i{
	case (1...100000000):
		break infinity
	default:
		i = random()
		i
	}
}

//available
if #available(iOS 9, OSX 10.10, *) {
	// Use iOS 9 APIs on iOS, and use OS X v10.10 APIs on OS X
} else {
	// Fall back to earlier iOS and OS X APIs
}













