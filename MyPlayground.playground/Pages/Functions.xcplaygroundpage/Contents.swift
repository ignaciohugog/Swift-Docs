//: [Previous](@previous)

import Foundation


//: [Next](@next)

/*
Parameters
*/

//Default parameters

//if exist default parameter we can omit that parameter when calling the function.
//place defaul parameters at the ende of the function in order to garantee same order and clarest
func someFunction(parameterWithDefault: Int = 12) -> Int{
	return parameterWithDefault + 1
}
someFunction()

//Variadic parameters

func arithmeticMean(numbers: Double...) -> Double {
	var total: Double = 0
	for number in numbers {
		total += number
	}
	return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers

//In out parameters

func swapTwoInts(inout a: Int, inout _ b: Int) {
	let temporaryA = a
	a = b
	b = temporaryA
}
var a = 1
var b = 0
swapTwoInts(&a, &b)

//using function types
func addTwoInts(a: Int, _ b: Int) -> Int {
	return a + b
}

func multiplyTwoInts(a: Int, _ b: Int) -> Int {
	return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
mathFunction = multiplyTwoInts

func stepForward(input: Int) -> Int {
	return input + 1
}

func stepBackward(input: Int) -> Int {
	return input - 1
}
//return a function with type (Int) -> Int
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
	return backwards ? stepBackward : stepForward
}

//neasted functions
func chooseStepFunctionNeasted(backwards: Bool) -> (Int) -> Int {
	func stepForward(input: Int) -> Int { return input + 1 }
	func stepBackward(input: Int) -> Int { return input - 1 }
	return backwards ? stepBackward : stepForward
}

























