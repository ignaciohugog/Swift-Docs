//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//Clouseres -> can capture and store references to any constants and variables from context in which they are defined

// - global functions
// - nested functiones
// - closure expressions => Inferring parameter and return value types | IMplicit returs| shorthand argument names | trailing clousure syntax

/*
Clousure Expressions
*/

//sort method accpets a clousere

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, _ s2: String) -> Bool {
	return s1 > s2
}
var reversed = names.sort(backwards)

//syntax

//{(parameters) -> return type in 
//   statements
//}

var reversed2 = names.sort({(s1:String, s2:String) ->
	Bool in return s1>s2
})


//Inferring Type From Context

//the sort is being called on an string array so the argument must be a function type (String, String)->Bool
//inferring means that we dont need to write the types of the clousure:

var reverse3 = names.sort({s1,s2 in return s1>s2})
reverse3

//Implicit Returns from Single-Expression Closures

var reverse4 = names.sort({s1,s2 in s1>s2})
reverse4

//Shorthand Argument Names ($0,$1,$3)

var reverse5 = names.sort({$0>$1})
reverse5

//Operator functions

var reverse6 = names.sort(>)

//Trailing Closures

let digitNames = [
	0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
	5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
	(number) -> String in
	var number = number //“The parameters to functions and closures are always constants.
	var output = ""
	while number > 0 {
		output = digitNames[number % 10]! + output
		number /= 10
	}
	return output
}

let succsor = [1,2,3,4,5].map { (value) -> Int in
	return value + 1
}

//Capturing values
//“Capturing by reference ensures that runningTotal and amount do not disappear when the call to makeIncrementer ends, 
//and also ensures that runningTotal is available the next time the incrementer function is called.


func makeIncrementer(forIncrement amount: Int) -> () -> Int {//external name:forIncrement | internal name:mount
	var runningTotal = 0
	func incrementer() -> Int {
		runningTotal += amount//capture a reference from the surrounding function(context)
		return runningTotal
	}
	return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
let incrementBySeven = makeIncrementer(forIncrement: 7)

var a = incrementByTen()
var b = incrementByTen()

a = incrementBySeven()+incrementBySeven()


//calusures are reference types

let clusureSuma = {(A:Int, B:Int)->Int in return A+B}
let clusureSuma2 = clusureSuma
let result = clusureSuma(3,4)

//nonescaping closures @noescape

//clousure escape a functiuon when the clusure is passed as an argument 
//to the function and its called after the function returns
//for example the sort method must be noescape because we need the argument to Sort !!
//Marking a closure with @noescape lets you refer to self implicitly within the closure

//Autoclosure
//let us to  delay evaluation because the code inside isn't run until you call the clousure

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//print(customersInLine.count)
// Prints "5"

//let customerProvider = { customersInLine.removeAtIndex(0) }
//print(customersInLine.count)
//// Prints "5"
//
//print("Now serving \(customerProvider())!")
//// Prints "Now serving Chris!"
//print(customersInLine.count)
//// Prints "4”
//customerProvider()
//customersInLine

// takes an explicit clousure
func serveCustomer(customerProvider: () -> String) {
	print("Now serving \(customerProvider())!")
}
serveCustomer( { customersInLine.removeAtIndex(0) } )
// Prints "Now serving Alex!”

customersInLine

//instead of taking a explicit clousure it takes an autoclousure=> now you can call the function as if it took a String argument instead of a clousure
//because parameter is marked with the @autoclousure attribute

func serveCustomer(@autoclosure customerProvider: () -> String) {
	print("Now serving \(customerProvider())!")
}
serveCustomer(customersInLine.removeAtIndex(0))
// Prints "Now serving Ewa!”



//@autoclousre -> nonescaping
//if we want to escape:

// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(@autoclosure(escaping) customerProvider: () -> String) {
	customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.removeAtIndex(0))
collectCustomerProviders(customersInLine.removeAtIndex(0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
	print("Now serving \(customerProvider())!")
}
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!
customersInLine



































