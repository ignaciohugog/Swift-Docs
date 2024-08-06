import Foundation


/*
    Parameters
*/

//  Default parameters

//  if exist default parameter we can omit that parameter when calling the function.
//  place default parameters at the end of the function in order to garantee same order and clarest
func someFunction(parameterWithDefault: Int = 12) -> Int{
	parameterWithDefault + 1
}

someFunction()

// Variadic parameters

func arithmeticMean(numbers: Double...) -> Double {
	Double(numbers.reduce(0, +)) / Double(numbers.count)
}
arithmeticMean(numbers: 1, 2, 3, 4, 5)
arithmeticMean(numbers: 3, 8.25, 18.75)

// In out parameters

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
	let temporaryA = a
	a = b
	b = temporaryA
}
var a = 1
var b = 0
swapTwoInts(&a, &b)

// Function types
func addTwoInts(a: Int, _ b: Int) -> Int {
	a + b
}

func multiplyTwoInts(a: Int, _ b: Int) -> Int {
	a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2, 3))")
mathFunction = multiplyTwoInts

func stepForward(input: Int) -> Int {
	input + 1
}

func stepBackward(input: Int) -> Int {
	input - 1
}
// Return a function with type (Int) -> Int
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
	return backwards ? stepBackward : stepForward
}

// Nested functions
func chooseStepFunctionNeasted(backwards: Bool) -> (Int) -> Int {
	func stepForward(input: Int) -> Int { return input + 1 }
	func stepBackward(input: Int) -> Int { return input - 1 }
	return backwards ? stepBackward : stepForward
}

























