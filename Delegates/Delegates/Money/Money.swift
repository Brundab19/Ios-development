//
//  Money.swift
//  Delegates
//
//  Created by Brunda Basavarajappa on 02/09/24.
//

import Foundation

class Moneys {
    
    var delegate: DelegatesCheck
    
    init(delegate: DelegatesCheck) {
        self.delegate = delegate
    }
    
    func callDelegate() {
        delegate.callingDelegate()
    }
}
