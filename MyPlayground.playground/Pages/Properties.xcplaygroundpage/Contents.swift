//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


//Properties: Stored | Computed | Type

//Stored (class and structs)
//if a instance (STRUCT ONLY) is mark as a constant, so are all its properties.
//lAZY stored porperties (initial value is not calculated until the first time its used)

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
// the DataImporter instance for the importer property has not yet been created
//Because it is marked with the lazy modifier, the DataImporter instance for the importer property
//is only created when the importer property is first accessed, such as when its fileName property is queried:
print(manager.importer.fileName)

//Computed Properties (class, structs, enumerations)
//not actually store a value, instead, they provide a getter and an optional setter 
//to retrieve and set other properties and values indirectly.

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

//also with a default name used in setter

struct Rect {
	var origin = Point()
	var size = Size()
	var center: Point {
		get {
			let centerX = origin.x + (size.width / 2)
			let centerY = origin.y + (size.height / 2)
			return Point(x: centerX, y: centerY)
		}
		set {
			origin.x = newValue.x - (size.width / 2)
			origin.y = newValue.y - (size.height / 2)
		}
	}
}


var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Prints "square.origin is now at (10.0, 10.0)

//read only property not have the setter method and could be writen removing the get keyboard:

struct Cuboid {
	var width = 0.0, height = 0.0, depth = 0.0
	var volume: Double {
		return width * height * depth
	}
}

//Property Observers (willSet, didSet)
//observe and respond to cahnges in a property's value (called every time the property observes is set)
//cant add for lazy stored properties
//willSet: (default: newValue) as a constant parameter.
//didSet: (default: oldValue) as a constant parameter.

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
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896

//Type properties (static)
//are useful for defining values that are universal to all instances of a particular type

struct SomeStructure {
	static var storedTypeProperty = "Some value."
	static var computedTypeProperty: Int {
		return 1
	}
	var a=2
}
enum SomeEnumeration {
	static var storedTypeProperty = "Some value."
	static var computedTypeProperty: Int {
		return 6
	}
}
class SomeClass {
	static var storedTypeProperty = "Some value."
	static var computedTypeProperty: Int {
		return 27
	}
	class var overrideableComputedTypeProperty: Int {
		return 107
	}
}

print(SomeStructure.storedTypeProperty)
// Prints "Some value."
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// Prints "Another value."
print(SomeEnumeration.computedTypeProperty)
// Prints "6"
print(SomeClass.computedTypeProperty)
// Prints "27"


























