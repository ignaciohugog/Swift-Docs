import Foundation


// Properties: Stored | Computed | Type

/*
 Stored: (class and structs)

        If a instance (STRUCT ONLY) is mark as a constant, so are all its properties.

        lazy stored porperties ->
        (initial value is not calculated until the first time its used)

        You can also use a property wrapper to reuse code in the getter and setter of multiple properties.
 */

class DataImporter {
/*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a non-trivial amount of time to initialize.
    of time to initialize.
*/
	var fileName = "data.txt"
	// the DataImporter class would provide data importing functionality here
}

class DataManager {
	lazy var importer = DataImporter()
	var data = [String]()
	// the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
/*
    The DataImporter instance for the importer property has not yet been created
    because it is marked with the lazy modifier, the DataImporter instance for the
    importer property is only created when the importer property is first accessed,
    such as when its fileName property is queried:
 */
print(manager.importer.fileName)

/*
    Computed Properties (class, structs, enumerations):

    not actually store a value, instead, they provide a getter and an optional
    setter to retrieve and set other properties and values indirectly.
*/

struct Point {
	var x = 0.0, y = 0.0
}

struct Size {
	var width = 0.0, height = 0.0
}

//struct Rect {
//	var origin = Point()
//	var size = Size()
//	var center: Point {
//		get {
//			let centerX = origin.x + (size.width / 2)
//			let centerY = origin.y + (size.height / 2)
//			return Point(x: centerX, y: centerY)
//		}
//		set(newCenter) {
//			origin.x = newCenter.x - (size.width / 2)
//			origin.y = newCenter.y - (size.height / 2)
//		}
//	}
//}

// Also with a default name used in setter

struct Rect {
	var origin = Point()
	var size = Size()
	var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
		}
		set {
			origin.x = newValue.x - (size.width / 2)
			origin.y = newValue.y - (size.height / 2)
		}
	}
}


var square = Rect(
    origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0)
)

let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


// Read only property: not have the setter method and could be writen removing the get keyboard:

struct Cuboid {
	var width = 0.0, height = 0.0, depth = 0.0
	var volume: Double {
		width * height * depth
	}
}

/*
    Property Observers (willSet, didSet):
    - Observe and respond to cahnges in a property's value
    (called every time the property observes is set).
    - Can't add for lazy stored properties
    - willSet: (default: newValue) as a constant parameter.
    - didSet: (default: oldValue) as a constant parameter.
 */

class StepCounter {
	var totalSteps: Int = 0 {
		willSet(newTotalSteps) {
			print("About to set totalSteps to \(newTotalSteps)")
		}
		didSet {
			if totalSteps > oldValue  {
				print("Added \(totalSteps - oldValue) steps")
			}
		}
	}
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200

stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

/*
 Type properties (static): Are useful for defining values that are
    universal to all instances of a particular type

*/
struct SomeStructure {
	static var storedTypeProperty = "Some value."
	static var computedTypeProperty: Int {
		1
	}
}
enum SomeEnumeration {
	static var storedTypeProperty = "Some value."
	static var computedTypeProperty: Int {
		6
	}
}
class SomeClass {
	static var storedTypeProperty = "Some value."
	static var computedTypeProperty: Int {
		27
	}
	class var overrideableComputedTypeProperty: Int {
		107
	}
}

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."

print(SomeStructure.storedTypeProperty)

print(SomeEnumeration.computedTypeProperty)

print(SomeClass.computedTypeProperty)

/*
    Property Wrappers

 A property wrapper adds a layer of separation between code that manages how a property is stored and the code that defines a property.

 For example, if you have properties that provide thread-safety checks or store their underlying data in a database, you have to write that code on every property. When you use a property wrapper, you write the management code once when you define the wrapper, and then reuse that management code by applying it to multiple properties.
 */

// To define a property wrapper, you make a structure, enumeration, or class that defines a wrappedValue property:

struct SmallRectangle2 {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)
// Prints "0"

rectangle.height = 10
print(rectangle.height)
// Prints "10"

rectangle.height = 24
print(rectangle.height)
// Prints "12"


// Setting Initial Values for Wrapped Properties
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }

    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }

    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

// When you write = 1 on a property with a wrapper, that’s translated into a call to the init(wrappedValue:) initializer.
struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}


var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)
// Prints "2 3"


narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)
// Prints "5 4"

/*
 When you include property wrapper arguments, you can also specify an initial value using assignment.
 Swift treats the assignment like a wrappedValue argument and uses the initializer that accepts the arguments you include:
 */

struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}


var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)
// Prints "1"


mixedRectangle.height = 20
print(mixedRectangle.height)
// Prints "12"

// Projecting a Value From a Property Wrapper
@propertyWrapper
struct SmallNumber2 {
    private var number: Int
    private(set) var projectedValue: Bool


    var wrappedValue: Int {
        get { number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }


    init() {
        self.number = 0
        self.projectedValue = false
    }
}
struct SomeStructure2 {
    @SmallNumber2 var someNumber: Int
}
var someStructure2 = SomeStructure2()


someStructure2.someNumber = 4
print(someStructure2.$someNumber)
// Prints "false"


someStructure2.someNumber = 55
print(someStructure2.$someNumber)
// Prints "true"
