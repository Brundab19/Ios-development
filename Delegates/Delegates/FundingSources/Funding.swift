//
//  Funding.swift
//  Delegates
//
//  Created by Brunda Basavarajappa on 02/09/24.
//

import Foundation

class Fundings {

    let delegate: DelegatesCheck = Funding()
    
    func call() {
        callDelegate()
    }
    
    func callDelegate() {
        delegate.callingDelegate()
    }
}





