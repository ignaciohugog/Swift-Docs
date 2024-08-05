import Foundation

// String literal
let hello = "Hello World!"

// Multiline String Literals

let quotation = """

The white rabbit put on his spectacles.

"Wow"! This is funny!

"""

print(quotation)

// Extended String Delimiters

let exampleWithOutDelimiters = "Line 1 \nLine 2"
let exampleWithDelimiters = #"Line 1 \nLine 2"#

print("Without delimiters:\n" + exampleWithOutDelimiters)
print("With delimiters:\n" + exampleWithDelimiters)

// String interpolation
print("6 times 7 is \(6 * 7).")

/*
    Accessing and Modifying a String:
        Since different characters can require different amount of memory to store,
        you must iterate using indices instead of integer values.

        startIndex -> the positon of the first Character of a String
        endIndex   -> the position after the last Character of a String

    API:
        index(before:)
        index(after:)
        index(_:offsetBy:)

        insert(_:at:) / insert(contentsOf:at:)
        remove(_:at:) / removeSubrange(range)
 */
print("===========\n")
let greetting = "Guten Tag!"
print(greetting[greetting.startIndex])
print(greetting[greetting.index(before: greetting.endIndex)])
print(greetting[greetting.index(greetting.startIndex, offsetBy: 7)])

/*
    Substrings:
        Substrings is almost the same than String, but:
            substrings is used to work a short amount of time, the convert to String.
            The main differences beetween both is that substring can reuse part of memory that's used to store the original String.
 */

