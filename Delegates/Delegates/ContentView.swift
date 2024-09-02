//
//  ContentView.swift
//  Delegates
//
//  Created by Brunda Basavarajappa on 02/09/24.
//

import SwiftUI

struct ContentView: View {
    var vm = Moneys(delegate: Money())
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
                vm.callDelegate()
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
