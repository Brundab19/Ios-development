//
//  ContentView.swift
//  Uielements
//
//  Created by Brunda Basavarajappa on 02/09/24.
//

import SwiftUI

struct ContentView: View {
    let vm = FundingSource(delegate: UIElement())
    @State var name = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("hello ones")
            TextField("Name", text: $name)
                .onSubmit() {
                    vm.callDelegate(name: name)
                }
            
            
            Button {
                print("\(name)")
                vm.callDelegate(name: name)
            } label: {
                Text("Click here")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
