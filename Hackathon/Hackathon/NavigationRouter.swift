//
//  NavigationRouter.swift
//  Hackathon
//
//  Created by Chandan Kasamsetty on 20/06/24.
//

import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject {
    
    @Published var routes = [NavigationEnum]()
    
    func push(to screen: NavigationEnum) {
        routes.append(screen)
    }
    
    func goBack() {
        _ = routes.popLast()
    }
    
    func reset() {
        routes = []
    }
}
