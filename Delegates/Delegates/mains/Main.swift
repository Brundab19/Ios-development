//
//  Main.swift
//  Delegates
//
//  Created by Brunda Basavarajappa on 02/09/24.
//

import Foundation

protocol DelegatesCheck {
    func callingDelegate()
}

class Funding: DelegatesCheck {
    func callingDelegate() {
        print("This was called for funding")
    }
}

class Money: DelegatesCheck {
    func callingDelegate() {
        print("This was called for money")
    }
}
