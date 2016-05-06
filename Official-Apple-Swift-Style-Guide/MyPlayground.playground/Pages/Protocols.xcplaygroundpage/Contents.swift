//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/* Protocols */

//A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. 
//The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. 
//Any type that satisfies the requirements of a protocol is said to conform to that protocol

//In addition to specifying requirements that conforming types must implement, you can extend a protocol to implement some of these
//requirements or to implement additional functionality that conforming types can take advantage of


/* Porperty Requirements */

//The protocol doesn’t specify whether the property should be a stored property or a computed property—it only specifies the required
//property name and type. The protocol also specifies whether each property must be gettable or gettable and settable

//Property requirements are always declared as variable properties. 
//Gettable and settable properties are indicated by writing { get set } after their type declaration, 
//and gettable properties are indicated by writing { get }.

protocol SomeProtocol {
	var mustBeSettable: Int { get set }
	var doesNotNeedToBeSettable: Int { get }
}

//Always prefix type property requirements with the static keyword when you define them in a protocol
protocol AnotherProtocol {
	static var someTypeProperty: Int { get set }
}

//example:
protocol FullyNamed {
	var fullName: String { get }
}

struct Person: FullyNamed {
	var fullName: String
}

/* Method Requirements */
protocol RandomNumberGenerator {
	func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
	var lastRandom = 42.0
	let m = 139968.0
	let a = 3877.0
	let c = 29573.0
	func random() -> Double {
		lastRandom = ((lastRandom * a + c) % m)
		return lastRandom / m
	}
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.37464991998171"
print("And another one: \(generator.random())")
// Prints "And another one: 0.729023776863283

/* Protocols as Types */
//example:

class Dice {
	let sides: Int
	let generator: RandomNumberGenerator //protocol
	init(sides: Int, generator: RandomNumberGenerator) {
		self.sides = sides
		self.generator = generator
	}
	func roll() -> Int {
		return Int(generator.random() * Double(sides)) + 1
	}
}

//use:
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
	print("Random dice roll is \(d6.roll())")
}

/* Delegation */
//it's define a protocol that encapsulates the delegate responsabilities, to guaranteed
//provide the functionality that has been delegated.
//Delegation can be used to respond to a particular action or to retrieve data from an 
//external source without needing to know the underlying type of that source

//this protocol can be adopted by any game that involves dice
protocol DiceGame {
	var dice: Dice { get }
	func play()
}

//this protocol can be adopted by any type to track the progress of a DiceGame
protocol DiceGameDelegate {
	func gameDidStart(game: DiceGame)
	func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
	func gameDidEnd(game: DiceGame)
}

class SnakesAndLadders: DiceGame {
	let finalSquare = 25
	let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
	var square = 0
	var board: [Int]
	init() {
		board = [Int](count: finalSquare + 1, repeatedValue: 0)
		board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
		board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
	}
	var delegate: DiceGameDelegate?
	func play() {
		square = 0
		delegate?.gameDidStart(self)
		gameLoop: while square != finalSquare {
			let diceRoll = dice.roll()
			delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
			switch square + diceRoll {
			case finalSquare:
				break gameLoop
			case let newSquare where newSquare > finalSquare:
				continue gameLoop
			default:
				square += diceRoll
				square += board[square]
			}
		}
		delegate?.gameDidEnd(self)
	}
}

//using

class DiceGameTracker: DiceGameDelegate {
	var numberOfTurns = 0
	func gameDidStart(game: DiceGame) {
		numberOfTurns = 0
		if game is SnakesAndLadders {
			print("Started a new game of Snakes and Ladders")
		}
		print("The game is using a \(game.dice.sides)-sided dice")
	}
	func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
		numberOfTurns += 1
		print("Rolled a \(diceRoll)")
	}
	func gameDidEnd(game: DiceGame) {
		print("The game lasted for \(numberOfTurns) turns")
	}
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

/* Adding Protocol Conformance with an Extension */

protocol TextRepresentable {
	var textualDescription: String { get }
}

extension Dice: TextRepresentable {
	var textualDescription: String {
		return "A \(sides)-sided dice"
	}
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)

/* Declaring protocol Adoption with an extension */

struct Hamster {
	var name: String
	var textualDescription: String {
		return "A hamster named \(name)"
	}
}
extension Hamster: TextRepresentable {}
//why?? -> because of that:
let simonTheHamster = Hamster(name: "Simon")
//hamster is "something text representable"
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)

/* Collections of Protocol Types */

let things: [TextRepresentable] = [d12, simonTheHamster]

for thing in things {
	print(thing.textualDescription)
}

/* Protocol Inheritance */
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
	// protocol definition goes here
}

/* Class-Only Protocols */
//used when the behavior defined by this protocol assumes or requires that
//conforming type has a reference semantics rather tahn value semantics

//protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
//	// class-only protocol definition goes here
//}

/* Protocol composition */

protocol Named {
	var name: String { get }
}
protocol Aged {
	var age: Int { get }
}

struct Person2: Named, Aged {
	var name: String
	var age: Int
}
func wishHappyBirthday(celebrator: protocol<Named, Aged>) { //means any type that conforms to both the Named and Aged protocols
	print("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}
let birthdayPerson = Person2(name: "Malcolm", age: 21)
wishHappyBirthday(birthdayPerson)
// Prints "Happy birthday Malcolm - you're 21!

/* Checking for Protocol Conformance */ //(as or is)
//example:
protocol HasArea {
	var area: Double { get }
}

class Circle: HasArea {
	let pi = 3.1415927
	var radius: Double
	var area: Double { return pi * radius * radius }
	init(radius: Double) { self.radius = radius }
}

class Country: HasArea {
	var area: Double
	init(area: Double) { self.area = area }
}

class Animal {
	var legs: Int
	init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
	Circle(radius: 2.0),
	Country(area: 243_610),
	Animal(legs: 4)
]

for object in objects {
	if let objectWithArea = object as? HasArea {
		print("Area is \(objectWithArea.area)")
	} else {
		print("Something that doesn't have an area")
	}
}

/* Optional Protocol Requirements */

@objc protocol CounterDataSource {
	optional func incrementForCount(count: Int) -> Int
	optional var fixedIncrement: Int { get }
}

class Counter {
	var count = 0
	var dataSource: CounterDataSource?
	func increment() {
		if let amount = dataSource?.incrementForCount?(count) { //thow level of optional chaining
			count += amount
		} else if let amount = dataSource?.fixedIncrement {
			count += amount
		}
	}
}

/* Protocol Extensions */
//This allows you to define behavior on protocols themselves, rather than in each type’s individual conformance or in a global function.

extension RandomNumberGenerator {
	func randomBool() -> Bool {
		return random() > 0.5
	}
}

let generator2 = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.37464991998171"
print("And here's a random Boolean: \(generator.randomBool())")
// Prints "And here's a random Boolean: true

/* Providing Default Implementation */
//If a conforming type provides its own implementation of a required method or property,
//that implementation will be used instead of the one provided by the extension.

/* Adding Constraints to Protocol Extensions */

extension CollectionType where Generator.Element: TextRepresentable {
	var textualDescription: String {
		let itemsAsText = self.map { $0.textualDescription }
		return "[" + itemsAsText.joinWithSeparator(", ") + "]"
	}
}

let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
print(hamsters.textualDescription)




















