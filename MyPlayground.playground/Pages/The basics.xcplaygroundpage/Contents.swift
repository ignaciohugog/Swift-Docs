/*
    Stored values declaration
*/

// always use constants if it's not going to change


/*
    Type Annotations
    place collon after the constant name, follow by a space, followed by the name of the type to use
*/

var welcome: String
var red, green, blue: Double

var `var` = 2
`var`+=1

/*
    Numeric literals
*/
let decimalInteger = 17           //no prefix
let binaryInteger = 0b10001       //0b prefix 17 in binary notation
let octalInteger = 0o21           //0o prefix 17 in octal notation
let hexadecimalInteger = 0x11     //0x prefix 17 in hexadecimal notation”

/*
    Type alias
*/
// alternative name for an existing type
// the first letter of the type alias name  is in uppercase

typealias Container = Array<Int>

/*
    Tuples
*/
let (typeV1, typeV2) = (3, 4)
typeV1
typeV2

let http404Error = (status:404, error:"Not Found")
let (status, _) = http404Error

/*
    Optional binding
*/

if let constantName = Int(http404Error.error) {
	//statements
}

let optionalInt = Int(http404Error.error)

// Shorter version
if let optionalInt {

}

// multiple optinal binding
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}
// guard method variables are available in the lines of code that follow the statement
for i in 0...10 {
	guard let firstNumber = Int("4") else{
		break
	}
	firstNumber
}

/*
Error handling
*/

/*
    Debugging with Assertions
        -> is only executed in debug builds and is disabled in release builds.

*/

let age = 9
assert(age >= 0, "A person's age cannot be less than zero")

/*
    Enforcing Preconditions: Use a precondition whenever a condition has the potencial to be false,
                             but must definitely be true for your code yo continue execution.

 -> It’s executed in both debug and release builds. It’s intended to check for conditions that must be true for the program to continue executing, but that are not necessarily programming errors.
 */

precondition(age > 0)

