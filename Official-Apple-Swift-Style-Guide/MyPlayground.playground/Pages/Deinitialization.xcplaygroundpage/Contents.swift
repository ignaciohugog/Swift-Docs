//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//A deinitializer is called immediately before a class instance is deallocated. 
//You write deinitializers with the deinit keyword, similar to how initializers
//are written with the init keyword. 
//Deinitializers are only available on class types

class Bank {
	static var coinsInBank = 10_000
	static func vendCoins(numberOfCoinsRequested: Int) -> Int {
		let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
		coinsInBank -= numberOfCoinsToVend
		return numberOfCoinsToVend
	}
	static func receiveCoins(coins: Int) {
		coinsInBank += coins
	}
}

class Player {
	var coinsInPurse: Int
	init(coins: Int) {
		coinsInPurse = Bank.vendCoins(coins)
	}
	func winCoins(coins: Int) {
		coinsInPurse += Bank.vendCoins(coins)
	}
	deinit {
		Bank.receiveCoins(coinsInPurse)
	}
}

var playerOne: Player? = Player(coins: 100)
playerOne?.coinsInPurse
Bank.coinsInBank

playerOne!.winCoins(2_000)
playerOne?.coinsInPurse
Bank.coinsInBank

playerOne = nil
Bank.coinsInBank