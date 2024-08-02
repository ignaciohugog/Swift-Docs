//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//The rules for how initializer delegation works, and for what forms of delegation are allowed, are different for 
//value types and class types. Value types (structures and enumerations) do not support inheritance, and so their 
//initializer delegation process is relatively simple, because they can only delegate to another initializer that they 
//provide themselves. Classes, however, can inherit from other classes, as described in Inheritance. This means that 
//classes have additional responsibilities for ensuring that all stored properties they inherit are assigned a 
//suitable value during initialization. These responsibilities are described below:

//Swift defines two kinds of initializers for class types to help ensure all stored properties receive an initial 
//value. These are known as designated initializers and convenience initializers.

//(Designated vs Convenience) Initializers
//Initializer Delegation for Class Types
//To simplify the relationships between designated and convenience initializers, Swift applies the following three 
//rules for delegation calls between initializers:
//
//Rule 1
//A designated initializer must call a designated initializer from its immediate superclass.
//
//Rule 2
//A convenience initializer must call another initializer from the same class.
//
//Rule 3
//A convenience initializer must ultimately call a designated initializer.


//resume:
//Designated initializers must always delegate up.
//Convenience initializers must always delegate across.

class Food {
	var name: String
	init(name: String) {
		self.name = name
	}
	convenience init() {
		self.init(name: "[Unnamed]")
	}
}

let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()

class RecipeIngredient: Food {
	var quantity: Int
	init(name: String, quantity: Int) {
		self.quantity = quantity
		super.init(name: name)
	}
	override convenience init(name: String) {
		self.init(name: name, quantity: 1)
	}
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem: RecipeIngredient {
	var purchased = false
	var description: String {
		var output = "\(quantity) x \(name)"
		output += purchased ? " ✔" : " ✘"
		return output
	}
}

var breakfastList = [
	ShoppingListItem(),
	ShoppingListItem(name: "Bacon"),
	ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
	print(item.description)
}
// 1 x Orange juice ✔
// 1 x Bacon ✘
// 6 x Eggs ✘

//Failable Initializers (init?)
struct Animal {
	let species: String
	init?(species: String) {
		if species.isEmpty { return nil }
		self.species = species
	}
}

let animal = Animal(species: "")

animal==nil
//using in enums
enum TemperatureUnit {
	case Kelvin, Celsius, Fahrenheit
	init?(symbol: Character) {
		switch symbol {
		case "K":
			self = .Kelvin
		case "C":
			self = .Celsius
		case "F":
			self = .Fahrenheit
		default:
			return nil
		}
	}
}

let c = TemperatureUnit(symbol: "F")

class Product {
	let name: String
	init?(name: String) {
		if name.isEmpty { return nil }
		self.name = name
	}
}

class CartItem: Product {
	let quantity: Int
	init?(name: String, quantity: Int) {
		if quantity < 1 { return nil }//Ensures that always has a value of at least 1
		self.quantity = quantity
		super.init(name: name)
	}
}

//The init! Failable Initializer

//Required Initializers (required)

//Setting a Default Property Value with a Closure or Function

struct Chessboard {
	let boardColors: [Bool] = {
		var temporaryBoard = [Bool]()
		var isBlack = false
		for i in 1...8 {
			for j in 1...8 {
				temporaryBoard.append(isBlack)
				isBlack = !isBlack
			}
			isBlack = !isBlack
		}
		return temporaryBoard
	}()
	func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
		return boardColors[(row * 8) + column]
	}
}

let board = Chessboard()
print(board.squareIsBlackAtRow(0, column: 1))
// Prints "true"
print(board.squareIsBlackAtRow(7, column: 7))
// Prints "false























