//
//  ContentView.swift
//  H4XOR
//
//  Created by Brunda Basavarajappa on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            
            List(posts){ post in
                Text(post.title)
            }
            .navigationTitle("H4XOR NEWS")
            
        }

    }
}

struct Post: Identifiable {
    let id: String
    let title: String
}

let posts = [
    Post(id: "1", title: "HELLO"),
    Post(id: "2", title: "hola"),
    Post(id: "3", title: "namaskar")
    
]
#Preview {
    ContentView()
}
