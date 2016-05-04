//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//optional chaining differs from forced unwrapping and enables you to check for success:

class Person {
	var residence: Residence?
}

class Residence {
	var numberOfRooms = 1
}

let john = Person()
//force (runtime error) let roomCount = john.residence!.numberOfRooms
//using optional chaining for properties, methods and subscripts as the same way

if let roomCount = john.residence?.numberOfRooms {
	print("John's residence has \(roomCount) room(s).")
} else {
	print("Unable to retrieve the number of rooms.")
}

//Linking Multiple Levels of Chaining
//If the type you are trying to retrieve is not optional, it will become optional because of the optional chaining.
//If the type you are trying to retrieve is already optional, it will not become more optional because of the chaining.



