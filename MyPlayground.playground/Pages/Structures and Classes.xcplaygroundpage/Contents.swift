import Foundation


/*
    Classes vs structures:

    both can:

    - Define properties to store values
    - Define methods to provide functionality
    - Define subscripts to provide access to their values using subscript syntax
    - Define initializers to set up their initial state
    - Be extended to expand their functionality beyond a default implementation
    - Conform to protocols to provide standard functionality of a certain kind

 Only classes:

 - Inheritance enables one class to inherit the characteristics of another.
 - Type casting enables you to check and interpret the type of a class instance at runtime.
 - Deinitializers enable an instance of a class to free up any resources it has assigned.
 - Reference counting allows more than one reference to a class instance.
*/

struct Resolution {
	var width = 0
	var height = 0
}

class VideoMode {
	var resolution = Resolution()
	var interlaced = false
	var frameRate = 0.0
	var name: String?
}

// default memberwise initializer
var someResolution = Resolution(width: 200, height: 10)

//classes doesn't have default memberwise initializer
let someVideoMode = VideoMode()

// Structures and enumerations are value types and classes are reference types

someVideoMode.resolution = someResolution
someResolution.height = 20
someVideoMode.resolution.height

// Identity Operators
// because classes are reference types we can do compare if  two classes have exactly the same instance
let tenEighty = VideoMode()
let alsoTenEighty = tenEighty

let alsoSomeResolution = someResolution

tenEighty === alsoTenEighty
tenEighty !== alsoTenEighty

/*

 As a general guideline, consider creating a structure when one or more of these conditions apply:

- The structure’s primary purpose is to encapsulate a few relatively simple data values.

- It is reasonable to expect that the encapsulated values will be copied rather than referenced when you assign or pass around an instance of that structure.

- Any properties stored by the structure are themselves value types, which would also be expected to be copied rather than referenced.

- The structure does not need to inherit properties or behavior from another existing type.

Examples of good candidates for structures include:

- The size of a geometric shape, perhaps encapsulating a width property and a height property, both of type Double.
- A way to refer to ranges within a series, perhaps encapsulating a start property and a length property, both of type Int.
- A point in a 3D coordinate system, perhaps encapsulating x, y and z properties, each of type Double.

In all other cases, define a class, and create instances of that class to be managed and passed by reference.
In practice, this means that most custom data constructs should be classes, not structures.

 => This could be outdated since Apple incentive is to create Structs, as a general norm.
*/

























