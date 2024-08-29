//
//  ContentView.swift
//  practice
//
//  Created by Brunda Basavarajappa on 29/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var givenName: String = ""
    @State private var familyName: String = ""
    
    var body: some View {
        
        NavigationView {
            ScrollView{
                VStack {
                    TextField(
                        "Given Name",
                        text: $givenName
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Family Name",
                        text: $familyName
                    )
                    .disableAutocorrection(true)
                }
                .textFieldStyle(.roundedBorder)
            }
        }.navigationTitle("Add Chore")
    }
}

#Preview {
    ContentView()
}
