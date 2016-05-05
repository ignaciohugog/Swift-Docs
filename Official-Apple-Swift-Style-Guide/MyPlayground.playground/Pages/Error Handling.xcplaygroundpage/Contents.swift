//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//using defer (explained at the page bottom)
let A = [1,3,3,5,6,7]
var C = 0

for item in A {
	defer {
		print(C+=2)
	}
	C+=1
}

func lala(inout C:Int) {
	defer {
		C+=1
	}
}

C
lala(&C)
C

/*
Throwing, catching, propagating and manipulating recoverable error at runtime
*/


//Representing and Throwing Errors

enum VendingMachineError:ErrorType {
	case InvalidSelection
	case InsufficientFunds(coinsNeeded:Int)
	case OutOfStock
}

//throw: means that the normal flow can't continue
throw VendingMachineError.InsufficientFunds(coinsNeeded: 20)

//handling errors, there are four ways:

/* propagate the error */

//Only throwing functions can propagate errors (func canThrowErrors() throws -> String)

struct Item {
	var price :Int
	var count :Int
}

class VendingMachine {
	var inventory = [
		"Candy Bar": Item(price: 12, count: 7),
		"Chips": Item(price: 10, count: 4),
		"Pretzels": Item(price: 7, count: 11)
	]
	var coinsDeposited = 0
	func dispenseSnack(snack: String) {
		print("Dispensing \(snack)")
	}

	func vend(itemNamed name: String) throws {
		guard let item = inventory[name] else {
			throw VendingMachineError.InvalidSelection
		}

		guard item.count > 0 else {
			throw VendingMachineError.OutOfStock
		}

		guard item.price <= coinsDeposited else {
			throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
		}

		coinsDeposited -= item.price

		var newItem = item
		newItem.count -= 1
		inventory[name] = newItem

		dispenseSnack(name)
	}
}
//Because the vend(itemNamed:) method propagates any errors it throws, any code that calls
//this method must either handle the errors—using a do-catch statement, try?, or try!—
//or continue to propagate them:

let favoriteSnacks = [
	"Alice": "Chips",
	"Bob": "Licorice",
	"Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
	let snackName = favoriteSnacks[person] ?? "Candy Bar"
	try vendingMachine.vend(itemNamed: snackName)
}


/* Handle the error using do-catch */
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
	try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
	print("Invalid Selection.")
} catch VendingMachineError.OutOfStock {
	print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
	print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}
/* handle the error as an optional value */
//if it throws an error while evaluating the try? the value of the expression is nil
func someThrowingFunction() throws -> Int {
	return 3
}

let x = try? someThrowingFunction() //it's the same to:

//let y: Int?
//do {
//	y = try someThrowingFunction()
//} catch {
//	y = nil
//}

/* defer */

//execute a set of statements just before code execution leaves the current block of code
//Deferred actions are executed in reverse order of how they are specified—that is, 
//the code in the first defer statement executes after code in the second, and so on.

//func processFile(filename: String) throws {
//	if exists(filename) {
//		let file = open(filename)
//		defer {
//			close(file)
//		}
//		while let line = try file.readline() {
//			// Work with the file.
//		}
//		// close(file) is called here, at the end of the scope.
//	}
//}

//You can use a defer statement even when no error handling code is involved

















