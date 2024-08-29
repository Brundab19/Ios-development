//
//  ContentView.swift
//  SAVE_LINKS
//
//  Created by Brunda Basavarajappa on 12/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            NavigationStack{
                NavigationLink("➕ Add NEW Folder", destination: AddNewFolderView(folderName: ""))
                NavigationLink("👁️Show Folder", destination: ShowFolderesView())
            }
        }
    }
}



#Preview {
    ContentView()
}
