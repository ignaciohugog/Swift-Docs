//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//Reference counting only applies to instances of classes. 
//Structures and enumerations are value types, not reference types, 
//and are not stored and passed by reference

class Person {
	let name: String
	init(name: String) {
		self.name = name
		print("\(name) is being initialized")
	}
	var apartment: Apartment?
	deinit {
		print("\(name) is being deinitialized")
	}
}

class Apartment {
	let unit: String
	init(unit: String) { self.unit = unit }
	var tenant: Person?
	deinit { print("Apartment \(unit) is being deinitialized") }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1
reference1 = nil
reference2 = nil
//reference3 = nil

//example of a cycle reference
var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

// !
john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

//solving: weak and unowned referencies
//Use a weak reference whenever it is valid for that reference to become nil 
//at some point during its lifetime. Conversely, use an unowned reference when
//you know that the reference will never be nil once it has been set during initialization

// 1- an aprtment can have a person as owner or not, and in the same way a person can have a apartement or not -> weak
// 2- a creditCard alwayas has a cutomer associated but a custommer not alwayas has a creditcard -> unowned
class Customer {
	let name: String
	var card: CreditCard?
	init(name: String) {
		self.name = name
	}
	deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
	let number: UInt64
	unowned let customer: Customer
	init(number: UInt64, customer: Customer) {
		self.number = number
		self.customer = customer
	}
	deinit { print("Card #\(number) is being deinitialized") }
}

var john2 = Customer(name: "John Appleseed")
john2.card = CreditCard(number: 1234_5678_9012_3456, customer: john2)

// 3- both need to have a value -> unowned property + implicity unwrappped optional property

class Country {
	let name: String
	var capitalCity: City! //implicity unwrappped optional property
	init(name: String, capitalName: String) {
		self.name = name
		self.capitalCity = City(name: capitalName, country: self)
	}
}

class City {
	let name: String
	unowned let country: Country //unowned
	init(name: String, country: Country) {
		self.name = name
		self.country = country
	}
}

var country = Country(name: "Canada", capitalName: "Ottawa")

//A strong reference cycle can also occur if you assign a closure to a property of a class instance, and the body of that closure captures the 
//instance. This capture might occur because the closure’s body accesses a property of the instance, such as self.someProperty, or because the
//closure calls a method on the instance, such as self.someMethod(). 
//In either case, these accesses cause the closure to “capture” self, creating a strong reference cycle.
//This strong reference cycle occurs because closures, like classes, are reference types.
//When you assign a closure to a property, you are assigning a reference to that closure. 
//In essence, it’s the same problem as above—two strong references are keeping each other alive.
//However, rather than two class instances, this time it’s a class instance and a closure that are keeping each other alive.
// ---> clousure capture list

//axample of the clousure retain cycle problem

class HTMLElement {

	let name: String
	let text: String?

	lazy var asHTML: () -> String = {
		if let text = self.text {
			return "<\(self.name)>\(text)</\(self.name)>"
		} else {
			return "<\(self.name) />"
		}
	}

	init(name: String, text: String? = nil) {
		self.name = name
		self.text = text
	}

	deinit {
		print("\(name) is being deinitialized")
	}
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
//the closure captures self
paragraph?.asHTML()

//Resolving clousure retain cycle problem
//defining a capture list which defines the rules to use when capturing one or more reference types (unowned and weak)
//weak: when the captured reference may become nil at some point in the future.
//unowned: when the closure and the instance it captures will always refer to each other, and will always be deallocated at the same time

class HTMLElementSafe {

	let name: String
	let text: String?

	lazy var asHTML: () -> String = {
		[unowned self] in //capture self as an unowned reference rather than a strong reference
		if let text = self.text {
			return "<\(self.name)>\(text)</\(self.name)>"
		} else {
			return "<\(self.name) />"
		}
	}

	init(name: String, text: String? = nil) {
		self.name = name
		self.text = text
	}

	deinit {
		print("\(name) is being deinitialized")
	}

}





















