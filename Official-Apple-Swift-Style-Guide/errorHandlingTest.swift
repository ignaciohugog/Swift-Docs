//
//  errorHandlingTest.swift
//  Official-Apple-Swift-Style-Guide
//
//  Created by Ignacio H. Gomez on 4/25/16.
//  Copyright © 2016 Ignacio H. Gomez. All rights reserved.
//

import Foundation

enum VendingMachineError: ErrorType {
	case InvalidSelection
	case InsufficientFunds(coinsNeeded: Int)
	case OutOfStock
}

struct Item {
	var price: Int
	var count: Int
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

//using 

let favoriteSnacks = [
	"Alice": "Chips",
	"Bob": "Licorice",
	"Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
	let snackName = favoriteSnacks[person] ?? "Candy Bar"
	try vendingMachine.vend(itemNamed: snackName)
}

func something (){

	let vendingMachine = VendingMachine()
	vendingMachine.coinsDeposited = 8
	do {
		try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
	} catch VendingMachineError.InvalidSelection {
		print("Invalid Selection.")
	} catch VendingMachineError.OutOfStock {
		print("Out of Stock.")
	} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
		print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
	} catch {
		//default
	}
	// Prints "Insufficient funds. Please insert an additional 2 coins."
}

/*
errors to optional values
*/
func someThrowingFunction() throws -> Int {
	// ...
	return 2
}

let x = try? someThrowingFunction()
//==//
func someOther() {
	let y: Int?
	do {
		y = try someThrowingFunction()
	} catch {
		y = nil
	}
}

















