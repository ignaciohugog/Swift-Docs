//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/* Generic functions */

//given the function only works with Int types
func swapTwoInts(inout a: Int, inout _ b: Int) {
	let temporaryA = a
	a = b
	b = temporaryA
}

func swapTwoValues<T>(inout a:T, inout _ b:T) {
	let temporaryA = a
	a = b
	b = temporaryA
}

//<T> -> means placeholder for a type, so always give upper camel case names

var a = 10
var b = 23

/* Generic types */

struct Stack<Element> {
	var items = [Element]()
	mutating func push(item: Element) {
		items.append(item)
	}
	mutating func pop() -> Element {
		return items.removeLast()
	}
}

/* Extending a Generic Type */

extension Stack {
	var topItem:Element?  {
		return self.items.last
	}
}

/* Type Constraints */
//for example the Dictionary type places a limitation on the key types (need to be hashable)
//so the type constarinst specifies that the key type must conform the Hashable protocol

func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
	for (index, value) in array.enumerate() {
		if value == valueToFind {
			return index
		}
	}
	return nil
}

/* Associated Types */
//gives a placeholder name to a type that is used as part of the protocol
protocol Container {
	associatedtype ItemType
	mutating func append(item: ItemType)
	var count: Int { get }
	subscript(i: Int) -> ItemType { get }
}
//Any type that conforms to the Container protocol must be able to specify the type of values it stores.
//Specifically, it must ensure that only items of the right type are added to the container, 
//and it must be clear about the type of the items returned by its subscript.
//-> because it's infeerred in apped(_:) we dont need to write typealias ItemType = Int (or some another type) 

struct StackContainer<Element>:Container {
	var items = [Element]()
	mutating func push(item: Element) {
		items.append(item)
	}
	mutating func pop() -> Element {
		return items.removeLast()
	}

	// conformance to the Container protocol
	mutating func append(item: Element) {
		self.push(item)
	}
	var count: Int {
		return items.count
	}
	subscript(i: Int) -> Element {
		return items[i]
	}
}

/* Extending an Existing Type to Specify an Associated Type */
extension Array:Container {}

/* Where clausures */

func allItemsMatch<C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
	(someContainer: C1, _ anotherContainer: C2) -> Bool {

	// check that both containers contain the same number of items
	if someContainer.count != anotherContainer.count {
		return false
	}

	// check each pair of items to see if they are equivalent
	for i in 0..<someContainer.count {
		if someContainer[i] != anotherContainer[i] {
			return false
		}
	}
	// all items match, so return true
	return true

}


















