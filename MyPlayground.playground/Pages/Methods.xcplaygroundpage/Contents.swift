import Foundation

// Instance methods

class Counter {
	var count = 0

	func increment() {
		count += 1
	}
	func incrementBy(amount: Int, numberOfTimes: Int) {
		count += amount * numberOfTimes
	}
	func reset() {
		count = 0
	}
}

//self property only neccesary like this:
//struct Point {
//	var x = 0.0, y = 0.0
//	func isToTheRightOfX(x: Double) -> Bool {
//		return self.x > x
//	}
//}


// Modifying Value Types from Within Instance Methods (mutating)

struct Point {
	var x = 0.0, y = 0.0

	mutating func moveByX(deltaX: Double, y deltaY: Double) {
		x += deltaX
		y += deltaY
        // or:
		self = Point(x: x + deltaX, y: y + deltaY)
	}
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(deltaX: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// Prints "The point is now at (3.0, 4.0)

//Type Methods
class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
	}
}
SomeClass.someTypeMethod()
