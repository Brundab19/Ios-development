import UIKit
import Foundation
//var goldBars: Int = 0
//
//func incrementInventory(inventory by: inout Int, amount : Int = 100) {
//    by += amount
//}
//
//var goldbars = 0
//
//incrementInventory(inventory: &goldbars)
//print(goldbars)
//incrementInventory(inventory: &goldbars)
//print(goldbars)
//incrementInventory(inventory: &goldbars)
//print(goldbars)
//incrementInventory(inventory: &goldbars, amount: 300)
//print(goldbars)
//incrementInventory(inventory: &goldbars, amount: 50)
//print(goldbars)


//closures

//let closureTofindTheGreatestElementInTheArray: (_ array: [Int]) -> Int
//
//closureTofindTheGreatestElementInTheArray = { (array: [Int]) -> Int in
//    
//    var maxElement = array[0]
//    for i in 1..<array.count {
//        if array[i] > maxElement {
//            maxElement = array[i]
//        }
//    }
//    return maxElement
//}
//var array: [Int] = []
//array.append(3)
//array.append(20)
//array.append(500)
//array.append(100)
//array.append(5)
//print(closureTofindTheGreatestElementInTheArray(array))

//var goldBars: Int = 0
//let unlockTreasureChest = { (inventory: inout Int)  in
//    inventory += 10
//}
//
//print(goldBars)
//unlockTreasureChest(&goldBars)
//print(goldBars)


//var goldBars = 100
//
//func spendTenGoldBars(form inventory: inout Int, completion: ((Int) -> ()) ) {
//    inventory -= 10
//    completion(inventory)
//}
//
//let completion = { (goldBars: Int) in
//    print("You spent ten gold bars.")
//}
//
//
//print("You had \(goldBars) gold bars.")
//spendTenGoldBars(form: &goldBars, completion: completion)
//spendTenGoldBars(form: &goldBars) { goldBars in
//    print("You spent ten gold bars.")
//    print("You have \(goldBars) gold bars")
//}
//print("You have \(goldBars) gold bars.")


//func pushtocontroller(_ inventory: Int) {
//    completion(inventory)
//}
//
//let completion = { (goldbar:Int) in
//    print("yo u have \(goldbar)")
//}


//pushtocontroller(5)


//Structure

//struct TableReservation {
//    
//    var name: String
//    var tableNumber: Int
//    
//    mutating func updateBooking(name: String, tableNumber: Int) {
//        self.name = name
//        self.tableNumber = tableNumber
//    }
//}
//
//var johnBooking = TableReservation(name: "John", tableNumber: 1)
//print(johnBooking)
//johnBooking.updateBooking(name: "maria", tableNumber: 5)
//print(johnBooking)


//Class

//class LocalFile {
//    
//    let name: String
//    let fileExtension: String
//    var fullname: String {
//        return name+fileExtension
//    }
//    
//    init(name: String, fileExtension: String) {
//        self.name = name
//        self.fileExtension = fileExtension
//    }
//
//}
//
//let file = LocalFile(name: "image", fileExtension: ".png")
//print(file.fullname)

// Project

class createUser {
    
    func greet() {
        print("Welcome to your virtual bank system")
        print("What kind of account would you like to open")
        print("""
        1.Debit account
        2.Credit account
        """
        )
    }
    
    var accountType: String {
        return inputAccountType()
    }
    
    func inputAccountType() -> String {
        print("ENTER YOUR OPTION")
        var selectedAccout = Int.random(in: 1...5)
        return choosenBankAccount(selectedAccout)
    }
    
    let choosenBankAccount = { (selectedAccount: Int) -> String in
        print("The selected option is \(selectedAccount)")
       var selectedAccountType: String = ""
        
        switch selectedAccount {
        case 1 :
            selectedAccountType = "Debit account"
        case 2 :
            selectedAccountType = "Credit account"
        default:
            print("Invalid account type")
        }
        
        return selectedAccountType
    }
    
}

struct BankAccount {
    
    var debitBalance = 0
    var creditBalance = 0
    var creditLimit = 100
    
    var debitBalanceInfo:String {
        return String(debitBalance)
    }
    
    var availableCredit:Int {
        return creditLimit+creditBalance
    }
    
    var creditBalanceInfo: String {
        return ("Available credit$ \(availableCredit)")
    }
    
    mutating func debitDeposit(_ amount: Int) {
      debitBalance = debitBalance + amount
        print("Deposited $ \(amount) and \(debitBalance)")
    }
    
    mutating func creditDeposit(_ amount: Int) {
        creditBalance += amount
        print("Credit $ \(amount) and \(creditBalance) ")
        if creditBalance == 0 {
            print("Paid off credit balance")
        }
        else {
            print("overpaid credit balance")
        }
    }
    
    func checkCreditBalance() {
        
    }
}


let user1 = createUser()
user1.greet()
for i in 1...5 {
    print(user1.accountType)
}

