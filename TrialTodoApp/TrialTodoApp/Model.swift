//
//  Model.swift
//  TrialTodoApp
//
//  Created by Brunda Basavarajappa on 31/03/24.
//

import Foundation
import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    let item: String
    let done: Bool
}

