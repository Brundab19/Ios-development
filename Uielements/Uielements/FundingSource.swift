//
//  FundingSource.swift
//  Uielements
//
//  Created by Brunda Basavarajappa on 02/09/24.
//

import Foundation

class FundingSource {
    
    let delegate: Delegates
    init(delegate: Delegates) {
        self.delegate = delegate
    }
  
    
    func callDelegate(name: String) {
        delegate.printCallingFunction(name: name)
    }
}
