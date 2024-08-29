//
//  ProtocolModel.swift
//  GridGame
//
//  Created by Brunda Basavarajappa on 12/02/24.
//

import Foundation


protocol FlipModel {
    
    var isfliped :Bool { get }
    func toggle ()
    
}


class ProtocolModel: FlipModel,ObservableObject {
    
    @Published var isfliped: Bool = false
    
    func toggle() {
        isfliped.toggle()
    }
}
