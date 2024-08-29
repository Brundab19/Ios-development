//
//  ProjectCourseEra.swift
//  NammaMetro
//
//  Created by Brunda Basavarajappa on 06/07/24.
//

import Foundation

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
    
    func inputAccountType() {
        
        print("ENTER YOUR OPTION")
        if let selectedAccout = readLine() {
        choosenBankAccount(Int(selectedAccout)!)
        }
    }
    
    let choosenBankAccount = { (selectedAccount: Int) in
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
    }
    
}
