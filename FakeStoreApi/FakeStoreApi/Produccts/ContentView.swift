//
//  ContentView.swift
//  FakeStoreApi
//
//  Created by Brunda Basavarajappa on 07/04/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: ProductViewModel
    
    var body: some View {
        VStack {
            
            ForEach(model.productsArray){call in
                HStack {
                    
                    Text("\(call.rating.rate)")
                    
                    VStack {
                        Text(call.title)
                        Text(call.description)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(model: .init())
}
