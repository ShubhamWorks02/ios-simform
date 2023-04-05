import UIKit

enum VendingMachineError: Error {

    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock

}
//
//throw VendingMachineError.insufficientFunds(coinsNeeded: 1)

//Try Try! Try?
struct item {
    
    var itemPrice  : Int
    var itemCount : Int
    
}
class VendingMachine {
    
    var inventory  = [
        "chocolate" : item(itemPrice: 50, itemCount: 2),
        "milk" : item(itemPrice: 30, itemCount: 0),
        "atta" : item(itemPrice: 20, itemCount: 3),
    ]
    var balanceCoins = 0
    
    func vend(itemNamed name: String) throws {
        
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
    
        guard item.itemCount > 0 else {
              throw VendingMachineError.outOfStock
        }

        guard item.itemPrice < balanceCoins else {
            
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.itemPrice - balanceCoins)
            
        }
        
        balanceCoins -= item.itemPrice
        var newItem = item
        newItem.itemCount -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
    
    
}
//
var perform = VendingMachine()
perform.balanceCoins = 100
//try perform.vend(itemNamed: "milk")

//print(perform.inventory["atta"]?.itemCount)
let favoriteSnacks = [
    "Alice": "atta",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}
var isn = VendingMachine()

isn.balanceCoins = 90

//
//do {
//
//    try buyFavoriteSnack(person: "Alice", vendingMachine: isn)
//    print("in do ")
//
//} catch  {
//    print("in Catch")
//}


//
//do {
//    try <#expression#>
//    <#statements#>
//} catch <#pattern 1#> {
//    <#statements#>
//} catch <#pattern 2#> where <#condition#> {
//    <#statements#>
//} catch <#pattern 3#>, <#pattern 4#> where <#condition#> {
//    <#statements#>
//} catch {
//    <#statements#>
//}

var chcking = VendingMachine()
chcking.balanceCoins = 5

//do {
//
//    try buyFavoriteSnack(person: "Alice", vendingMachine: chcking)
//    print("in try stat , will only execute when try does not thrwo error")
//
//}catch VendingMachineError.invalidSelection {
//    print("invalidSelection")
//}catch VendingMachineError.insufficientFunds(let coinsNeeded){
//    print("need \(coinsNeeded) coins")
//}catch {
//    print("Unexpected error: \(error).")
//}
//
//print("bahar scope")

//do {
//
//    try chcking.vend(itemNamed: "atta")
//    print("in try stat , will only execute when try does not thrwo error")
//
//}catch is VendingMachineError {
//    print("vending machine type error")
//
//}
//print("bahar scope")

func nourish(with item: String) throws {
    do {
        try chcking.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Couldn't buy that from the vending machine.")
        throw VendingMachineError.insufficientFunds(coinsNeeded: 4)
    }
}

do {
    try nourish(with: "atta")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
    
}

//func someThrowingfunc () throws -> Int {
//
//
//
//}
let  y = {
    
}
let x = (try? chcking.vend(itemNamed: "item")) ?? print("cannot contain has def")
x
print(type(of: x))
//func someThrowingFunction() throws -> Int {
//    // ...
//}
//
//let x = try? someThrowingFunction()
//
//let y: Int?
//do {
//    y = try someThrowingFunction()
//} catch {
//    y = nil
//}
//If someThrowingFunction() throws an error, the value of x and y is nil. Otherwise, the value of x and y is the value that the function returned. Note that x and y are an optional of whatever type someThrowingFunction() returns. Here the function returns an integer, so x and y are optional integers.
func processFile()  {
    print("start defer")
        defer {
            print("in defer")
        }
    print("end func")
    }
processFile()

