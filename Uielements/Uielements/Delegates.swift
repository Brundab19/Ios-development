//
//  Delegates.swift
//  Uielements
//
//  Created by Brunda Basavarajappa on 02/09/24.
//

import Foundation

protocol Delegates {
    func printCallingFunction(name: String)
}

class UIElement: Delegates {
    func printCallingFunction(name: String) {
        print("This was called by \(name)")
        
    }
}
