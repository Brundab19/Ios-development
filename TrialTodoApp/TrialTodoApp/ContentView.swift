//
//  ContentView.swift
//  TrialTodoApp
//
//  Created by Brunda Basavarajappa on 31/03/24.
//

import SwiftUI

struct ContentView: View {
    var item: String
    @ObservedObject var viewModel = ViewModel()
    @State var newItemTitle: String = ""
    var colors : [Color] = [.blue , .green ,.yellow]
    var body: some View {
        //        VStack {
        //            TextField("Enter the name", text: $newItemTitle)
        //            Button(action: {
        //                viewModel.addItems(with: .init(item: newItemTitle, done: false))
        //                newItemTitle = ""
        //            }, label: {
        //                Text("Save")
        //            })
        //            List {
        //                ForEach(viewModel.items) { items in
        //                    Text(items.item)
        //                }
        //            }
        //        }
        //        .padding()
        VStack {
            HStack {
                ForEach(colors, id:\.self) { item in
                    Rectangle()
                        .fill(item)
                        .frame(width: 100,height: 100)
                }
            }
            
            HStack () {
                ForEach(colors, id:\.self) { item in
                    Rectangle()
                        .fill(item)
                        .frame(width: 100,height: 100)
                }
            }
            
            HStack {
                ForEach(colors, id:\.self) { item in
                    Rectangle()
                        .fill(item)
                        .frame(width: 100,height: 100)
                }
            }
        }
    }
}

#Preview {
    ContentView(item: "readBOOKS")
}
