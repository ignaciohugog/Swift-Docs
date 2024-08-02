//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

var shoppingList = ["Eggs", "Milk", "Flour", "Powser"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

//change range of values at once
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList

//if we need integer index and the item value use:

for (index, value) in shoppingList.enumerate() {
	print("Item \(index + 1): \(value)")
}


/*

Sets

*/

//implement a set of CUSTOM objects

func == (first:MyClass, second:MyClass) -> Bool {
	return first.hashValue == second.hashValue
}

class MyClass:Hashable {
	var A:Int
	init(_ value:Int) {
		//OJO this value MUST be some that is distinctly differet from another object
		//if some object has the same value of A, they are going to be the same!!
		self.A = value
	}

	//as class not inherate from NSObject dont implement this protocols methods:
	var hashValue: Int {
		get {
			return self.A.hashValue
		}
	}
}

let miClassA = MyClass(2)
let miClassB = MyClass(3)
let miClassC = MyClass(4)

var mySet:Set = [miClassA, miClassB]

//returns removed value

if let removedGenre = mySet.remove(miClassC) {
	print("\(removedGenre)? I'm over it.")
} else {
	print("I never much cared for that.")
}

//iterate over values in specific order n log(n)

/*
Performing Set Operatios (intersect, exclusiveOr, union, subtract, ==, isSubsetOf, isUpersetOf)
*/

//Use the “is equal” operator (==) to determine whether two sets contain all of the same values.

//Use the isSubsetOf(_:) method to determine whether all of the values of a set are contained in the specified set.

//Use the isSupersetOf(_:) method to determine whether a set contains all of the values in a specified set.

//Use the isStrictSubsetOf(_:) or isStrictSupersetOf(_:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.

//Use the isDisjointWith(_:) method to determine whether two sets have any values in common.

let oddDigits: Set = [1, 3, 5, 7, 9]
let oddDigitsTest: Set = [1, 3, 5, 7, 9, 10, 20]
let evenDigits: Set = [0, 2, 4, 6, 8]
let evenDigitsTest: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()
oddDigits==oddDigitsTest
oddDigits.isSubsetOf(oddDigitsTest)
oddDigitsTest.isSupersetOf(oddDigits)
evenDigits.isSubsetOf(evenDigitsTest)
evenDigitsTest.isStrictSubsetOf(evenDigitsTest)

/*

Dictionaries

*/

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//updateValue
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
	print("The old value for DUB was \(oldValue).")
}

if let removedValue = airports.removeValueForKey("DUB") {
	print("The removed airport's name is \(removedValue).")
} else {
	print("The airports dictionary does not contain a value for DUB.")
}

for (airportCode, airportName) in airports {
	print("\(airportCode): \(airportName)")
}





























