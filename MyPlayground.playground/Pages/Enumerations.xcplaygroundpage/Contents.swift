import Foundation

enum CompassPoint:String {
	case north
	case south
	case east
	case west
}

// Implicitly Assigned Raw Values
enum Planet: Int {
	case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let venus = Planet.venus.rawValue

// Here the type (CompassPoint) is inferred
var directionToHead = CompassPoint.north

// Then we can change it with the shortcut
directionToHead = .east

switch directionToHead {
case .north:
	print("Lots of planets have a north")
case .south:
	print("Watch out for penguins")
case .east:
	print("Where the sun rises")
case .west:
	print("Where the skies are blue")
}

// Iterating: CaseIterable
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count

// Associated Values

enum Bardode {
	case upc(Int, Int, Int, Int)
	case qrCode(String)
}

var productBarcode = Bardode.upc(8, 85909, 51226, 3)

switch productBarcode {
case .upc(let a, let b, let c, let d): //short: case let .UPCA(a, b, c, d):
	print(a + b + c + d)
default:
	print("algo")
}

/* Raw values
    enumerations cases come prepopulated
    the raw value for a particular enumeration case is always the same
*/

enum ASCIIControlCharacter: Character {
	case tab = "\t"
	case lineFeed = "\n"
	case carriageReturn = "\r"
}

var characterA = ASCIIControlCharacter.tab
characterA.rawValue == "\t"



// Initializing from a Raw Value
let possiblePlanet = Planet(rawValue: 7)

// Recursive Enumerations (indirect) -> has a noather instance of the enumeration as associated value

enum ArithmeticExpression {
	case number(Int)
	indirect case addition(ArithmeticExpression, ArithmeticExpression)
	indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// Also:
 indirect enum ArithmeticExp {
	case number(Int)
	case addition(ArithmeticExp, ArithmeticExp)
	case multiplication(ArithmeticExp, ArithmeticExp)
}

//(5 + 4) * 2 

let five: ArithmeticExp = .number(5)
let four: ArithmeticExp = .number(4)
let sum: ArithmeticExp = .addition(five, four)
let product: ArithmeticExp = .multiplication(sum, .number(2))


func evaluate(_ expression: ArithmeticExp) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let total = evaluate(product)

// another useful examples:

indirect enum LinkedList<Element> {
    case empty
    case node(Element, LinkedList<Element>)
}

func length<Element>(of list: LinkedList<Element>) -> Int {
    switch list {
    case .empty:
        return 0
    case .node(_, let next):
        return 1 + length(of: next)
    }
}

// Example: [1, 2, 3]
let list: LinkedList<Int> = .node(1, .node(2, .node(3, .empty)))

print(length(of: list)) // Outputs: 3

indirect enum JSON {
    case null
    case boolean(Bool)
    case number(Double)
    case string(String)
    case array([JSON])
    case object([String: JSON])
}

// Example: { "key": [true, false, null], "anotherKey": 123.45 }
let json: JSON = .object([
    "key": .array([.boolean(true), .boolean(false), .null]),
    "anotherKey": .number(123.45)
])

print(json) 





















