import Foundation

// Use macros to generate code at compile time


// Freestanding Macros
func myFunction() {
    print("Currently running \(#function)")
    #warning("Something's wrong")
}

// Attached Macros

// without macros
//struct SundaeToppings: OptionSet {
//    let rawValue: Int
//    static let nuts = SundaeToppings(rawValue: 1 << 0)
//    static let cherry = SundaeToppings(rawValue: 1 << 1)
//    static let fudge = SundaeToppings(rawValue: 1 << 2)
//}


//@attached(member, names: named(RawValue), named(rawValue),
//        named(`init`), arbitrary)
//@attached(extension, conformances: OptionSet)
//public macro OptionSet<RawType>() =
//        #externalMacro(module: "SwiftMacros", type: "OptionSetMacro")
//
//@OptionSet<Int>
//struct SundaeToppings {
//    private enum Options: Int {
//        case nuts
//        case cherry
//        case fudge
//    }
//}
//SundaeToppings.Options.cherry.rawValue
print("dsad")
