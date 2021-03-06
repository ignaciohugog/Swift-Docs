//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

struct BlackjackCard {

	// nested Suit enumeration
	enum Suit: Character {
		case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
	}

	// nested Rank enumeration
	enum Rank: Int {
		case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
		case Jack, Queen, King, Ace
		struct Values {
			let first: Int, second: Int?
		}
		var values: Values {//computed property
			switch self {
			case .Ace:
				return Values(first: 1, second: 11)
			case .Jack, .Queen, .King:
					return Values(first: 10, second: nil)
			default:
				return Values(first: self.rawValue, second: nil)
			}
		}
	}

	// BlackjackCard properties and methods
	let rank: Rank, suit: Suit
	var description: String {//computed property
		var output = "suit is \(suit.rawValue),"
		output += " value is \(rank.values.first)"
		if let second = rank.values.second {
			output += " or \(second)"
		}
		return output
	}
}

let game = BlackjackCard(rank: .Three, suit: .Clubs)
let a = game.rank.values
a.first
a.second