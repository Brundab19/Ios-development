//
//  ContainerView.swift
//  Chores1
//
//  Created by Brunda Basavarajappa on 15/02/24.
//

import SwiftUI

struct ContainerView: View {
    
    @State var initialViewAppear = true
    
    var body: some View {
    
        
        if !initialViewAppear {
            ContentView()
        }
        else {
            InitialView(intialViewAppear: $initialViewAppear)
        }
    }
}

#Preview {
    ContainerView()
}
