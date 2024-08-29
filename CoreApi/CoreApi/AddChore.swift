//
//  AddChore.swift
//  CoreApi
//
//  Created by Brunda Basavarajappa on 07/02/24.
//

import SwiftUI

struct AddChore: View {
    
    @State var text: String = ""
    @State var name: String
    
    var body: some View {
        
        NavigationStack{
            VStack {
                TextField(name,text: $text)
            }.navigationTitle("Addchore")
        }
    }
}

//#Preview {
//    AddChore(name: "title")
//}
