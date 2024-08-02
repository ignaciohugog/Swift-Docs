//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/* Bitwise Operators */

//NOT operator (~)
//The bitwise NOT operator is a prefix operator, and appears immediately before the value it operates on, without any white space:
let initialBits: UInt8 = 0b00001111 //UInt8 mean 8 bits (0-255)
let invertedBits = ~initialBits  // equals 11110000

//AND operator (&)
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits  // equals 00111100”

//OR operator (|)
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // equals 11111110

//XOR operator
//The bitwise XOR operator, or “exclusive OR operator” (^), compares the bits of two numbers. 
//The operator returns a new number whose bits are set to 1 where the input bits are different and are set to 0 where the input bits are the same:”

let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits  // equals 00010001”

//Left and Right Shift Operators (<< >>)
//Bitwise left and right shifts have the effect of multiplying or dividing an integer number by a factor of two. 
//Shifting an integer’s bits to the left by one position doubles its value, whereas shifting it to the right by one position halves its value.

//logical shift

//1-Existing bits are moved to the left or right by the requested number of places.
//2-Any bits that are moved beyond the bounds of the integer’s storage are discarded.
//3-Zeros are inserted in the spaces left behind after the original bits are moved to the left or right.

let shiftBits: UInt8 = 4   // 00000100 in binary
shiftBits << 1             // 00001000
shiftBits << 2             // 00010000
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000
shiftBits >> 2             // 00000001

/* Shifting Behavior for Signed Integers */
//we use the complment and first bit determines if negative or positive
//example 4 -> 0 0000100
//example -4 -> 1 111 1100 (1111100 = 124 = 2^7 - 4)

/* Precedence and Associativity */
//Operator precedence gives some operators higher priority than others; these operators are applied first.
//Operator associativity defines how operators of the same precedence are grouped together

/* Operator Functions */
struct Vector2D {
	var x = 0.0, y = 0.0
}
func + (left: Vector2D, right: Vector2D) -> Vector2D {
	return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector


/* Prefix and Postfix Operators */
//Classes and structures can also provide implementations of the standard unary operators.

prefix func - (vector: Vector2D) -> Vector2D {//means (-a)
	return Vector2D(x: -vector.x, y: -vector.y)
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive

/* Compound Assignment Operators */
//example:(+=)

func += (inout left: Vector2D, right: Vector2D) {
	left = left + right
}

/* Equivalence Operators */

func == (left: Vector2D, right: Vector2D) -> Bool {
	return (left.x == right.x) && (left.y == right.y)
}
func != (left: Vector2D, right: Vector2D) -> Bool {
	return !(left == right)
}

/* Custom Operators */

//(see the list of character that can be used to define custom operator)
//declared operator:
prefix operator +++ {}
//then give a meaning:
prefix func +++ (inout vector: Vector2D) -> Vector2D {
	vector += vector
	return vector
}

/* Precedence and Associativity for Custom Infix Operators */
//associativity: right|left|none

infix operator +- { associativity left precedence 140 }
func +- (left: Vector2D, right: Vector2D) -> Vector2D {
	return Vector2D(x: left.x + right.x, y: left.y - right.y)
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector





















