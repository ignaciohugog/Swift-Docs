import Foundation


// Assignation

let (first, second, third) = (1, 2, 3)


struct MyStruct {
	var a: Int
	var b: Int
	var c: Int?
	init() {
		a = 1; b = 2;
		c = c ?? 3 // c = c != nil ? c! : 3
	}
}

let structA = MyStruct()
let structB = MyStruct()

class MiClass: NSObject {
	var a = 1
	var b = 1
}

let classA = MiClass()
let classB = MiClass()
let classC = classA
classC.a = 2
let test = classA.a
test


classA === classC



"bd"<"bc"

/*
    Nil coalescing operator (a ?? b)
    unwraps an optional a if it contains a value, or returns a default value b if a is nil
*/

structA.c

/*
    Strings can append characters:
*/
var a: Character = "a"
var s = "hol"
s.append(a)

// One-Sided Ranges

let numbers = [1, 2, 3, 4, 5, 6, 7]

for n in numbers[2...] {
    print(n)
}

print("=======")

for n in numbers[...2] {
    print(n)
}













