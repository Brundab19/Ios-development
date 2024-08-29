//
//  ChoreList.swift
//  Chores1
//
//  Created by Brunda Basavarajappa on 28/01/24.
//

import Foundation



struct Chore: Hashable, Identifiable {

    let id = UUID()
    var title: String
    var descp: String
    var inst:  String
    var dueDate: String
    var arrayOfChores = [String]()
    var createdDate: String
    var isComplete: Bool
    
}


