import Foundation

/*
    Clousures:
            Can capture and store references to any constants and variables
            from context in which they are defined

 */

// - global functions
// - nested functiones
// - closure expressions => Inferring parameter and return value types | IMplicit returs| shorthand argument names | trailing clousure syntax

/*
    Clousure Expressions
*/

// Sort method accepts a clousere

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, _ s2: String) -> Bool {
	s1 > s2
}

var reversed = names.sorted(by: backwards)

/* Syntax
         {(parameters) -> return type in
            statements
        }
 */


/* Inferring Type From Context

 The sort is being called on an string array
 so the argument must be a function type (String, String) -> Bool

 inferring means that we don't need to write the types of the clousure:

 */

var reversed2 = names.sorted(by: { s1, s2 in
    s1 > s2
})

// Shorthand Argument Names ($0,$1,$3)
var reverse5 = names.sorted(by: { $0 > $1 })
reverse5

// Operator functions
var reverse6 = names.sorted(by: >)

// Trailing Closures

let digitNames = [
	0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
	5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
	var output = ""
	while number > 0 {
		output = digitNames[number % 10]! + output
		number /= 10
	}
	return output
}

let succesor = [1,2,3,4,5].map { (value) -> Int in
    value + 1
}

/*
 Capturing values:

    Capturing by reference ensures that running Total and amount do not disappear
    when the call to makeIncrementer ends, and also ensures that runningTotal
    is available the next time the incrementer function is called.
 */


func makeIncrementer(forIncrement amount: Int) -> () -> Int {
	var runningTotal = 0
	func incrementer() -> Int {
		runningTotal += amount
		return runningTotal
	}
	return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
let incrementBySeven = makeIncrementer(forIncrement: 7)

var a = incrementByTen()
var b = incrementByTen()

a = incrementBySeven() + incrementBySeven()


// Clausures are reference types

let clusureSuma = {(A: Int, B: Int) -> Int in return A+B }
let clusureSuma2 = clusureSuma
let result = clusureSuma(3, 4)

/*
 Escaping Clousures:
        A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns. When you declare a function that takes a closure as one of its parameters, you can write @escaping before the parameter’s type to indicate that the closure is allowed to escape.

 Normally, a closure captures variables implicitly by using them in the body of the closure, but in this case you need to be explicit. If you want to capture self, write self explicitly when you use it, or include self in the closure’s capture list. Writing self explicitly lets you express your intent, and reminds you to confirm that there isn’t a reference cycle
 */

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x += 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()

instance.doSomething()
print(instance.x) // Prints "200"

completionHandlers.first?()
print(instance.x) // Prints "300"

struct SomeStruct {
    var x = 10
    mutating func doSomething() {
        someFunctionWithNonescapingClosure { x = 200 }  // Ok
//        someFunctionWithEscapingClosure { x = 100 }     // Error
    }
}

/* Autoclosure

 An autoclosure is a closure that’s automatically created to wrap an expression that’s being passed as an argument to a function. It doesn’t take any arguments, and when it’s called, it returns the value of the expression that’s wrapped inside of it.

 An autoclosure lets you delay evaluation, because the code inside isn’t run until you call the closure. Delaying evaluation is useful for code that has side effects or is computationally expensive, because it lets you control when that code is evaluated.

 */


var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count) // Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count) // Prints "5"
print("Now serving \(customerProvider())!") // Prints "Now serving Chris!"
print(customersInLine.count) // Prints "4”
customerProvider()
customersInLine

// takes an explicit clousure
func serveCustomer(_ customerProvider: () -> String) {
	print("Now serving \(customerProvider())!")
}
serveCustomer( { customersInLine.remove(at: 0) } ) // Prints "Now serving Ewa!”

/*
    instead of taking a explicit clousure it takes an autoclousure
    => now you can call the function as if it took a String argument instead of a clousure
        because parameter is marked with the @autoclousure attribute
*/

func serveCustomer(_ customerProvider: @autoclosure () -> String) {
	print("Now serving \(customerProvider())!")
}
serveCustomer(customersInLine.remove(at: 0))

