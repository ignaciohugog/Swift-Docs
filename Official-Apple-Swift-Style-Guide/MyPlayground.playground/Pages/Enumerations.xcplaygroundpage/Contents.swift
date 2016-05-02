//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//enumeration types should start with a capital letter and singular names rather than plural

enum CompassPoint:String {
	case North
	case South
	case East
	case West
}

enum Planet:Int {
	case Mercury=1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

//here the type (CompassPoint) ins inferred
var directionToHead = CompassPoint.North
//then we can change it with the shortcut
directionToHead = .East

directionToHead = .South
switch directionToHead {
case .North:
	print("Lots of planets have a north")
case .South:
	print("Watch out for penguins")
case .East:
	print("Where the sun rises")
case .West:
	print("Where the skies are blue")
}

//Associated Values -> (discriminated unions, tagged unions, or variants)
//Barcode is a enumeration type who takes UPCA and QRCode values and each one have differnet associated values types

enum Bardode {
	case UPCA(Int, Int, Int, Int)
	case QRCode(String)
}

var productBarcode = Bardode.UPCA(8, 85909, 51226, 3)

switch productBarcode {
case .UPCA(let a, let b, let c, let d): //short: case let .UPCA(a, b, c, d):
	print(a+b+c+d)
default:
	print("algo")
}

//raw values
//enumerations cases come prepopulated
//the raw value for a particular enumeration case is always the same

enum ASCIIControlCharacter: Character {
	case Tab = "\t"
	case LineFeed = "\n"
	case CarriageReturn = "\r"
}

var characterA = ASCIIControlCharacter.Tab
characterA.rawValue=="\t"
let earthsOrder = Planet.Earth.rawValue
let sunsetDirection = CompassPoint.West.rawValue



// Initializing from a Raw Value

let possiblePlanet = Planet(rawValue: 7)

//Recursive Enumerations (indirect)
//has a noather instance of the enumeration as associated value

//enum ArithmeticExpression {
//	case Number(Int)
//	indirect case Addition(ArithmeticExpression, ArithmeticExpression)
//	indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
//}

//also:
 indirect enum ArithmeticExpression {
	case Number(Int)
	case Addition(ArithmeticExpression, ArithmeticExpression)
	case Multiplication(ArithmeticExpression, ArithmeticExpression)
	func sum(){

	}
}

//(5 + 4) * 2 

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)

five.sum()

let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))

func evaluate(expression: ArithmeticExpression) -> Int {
	switch expression {
	case let .Number(value):
		return value
	case let .Addition(left, right):
		return evaluate(left) + evaluate(right)
	case let .Multiplication(left, right):
		return evaluate(left) * evaluate(right)
	}
}

let a = evaluate(product)























