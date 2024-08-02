//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//subclass can overrid method and variables (@override)


class Vehicle {
	var currentSpeed = 0.0
	var description: String {
		return "traveling at \(currentSpeed) miles per hour"
	}
	func makeNoise() {
		// do nothing - an arbitrary vehicle doesn't necessarily make a noise
	}
}

class Car: Vehicle {
	var gear = 1
	override var description: String {
		return super.description + " in gear \(gear)"
	}
}

//Preventing Overrides
//You can prevent a method, property, or subscript from being overridden by marking it as final.

