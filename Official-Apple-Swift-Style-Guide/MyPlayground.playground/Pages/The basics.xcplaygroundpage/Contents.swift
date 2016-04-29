//: Playground - noun: a place where people can play

import Cocoa

/*
 Stored values declaration
*/

//always use constants if it's not going to change


/*
Type Annotations
*/

//place collon after the constant name, folllowrd by a space, followed by the name of the type to use
var welcome: String
//multiple 
var red, green, blue: Double

var `var` = 2
`var`+=1

//type safe -> type checks

/*
Numeric literals
*/
let decimalInteger = 17           //no prefix
let binaryInteger = 0b10001       //0b prefix 17 in binary notation
let octalInteger = 0o21           //0o prefix 17 in octal notation
let hexadecimalInteger = 0x11     //0x prefix 17 in hexadecimal notation”

/*
Type alias
*/
//alternative name for an existing type
//the first letter of the type alias name  is in uppercase

typealias AudioSample = uint16
typealias Container = Array<Int>

/*
Tuples
*/
let (typeV1, typeV2) = (3, 4)
typeV1
typeV2

let tuple = (status:3, error:"err")
tuple.status

/*
Optional binding
*/

if let constantName = Int(tuple.error) {
	//statements
}
//multiple optinal binding and use where
if let firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
print("\(firstNumber) < \(secondNumber)")
}
//guard method variables are available in the lines of code that follow the statement
for i in 0...10 {
	guard let firstNumber = Int("4") else{
		break
	}
	firstNumber
}

/*
Error handling
*/

/*
Assertions
*/

let age = 9
assert(age >= 0, "A person's age cannot be less than zero")




