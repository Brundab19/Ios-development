//
//  AddNewFolderView.swift
//  SAVE_LINKS
//
//  Created by Brunda Basavarajappa on 13/03/24.
//

import SwiftUI

struct AddNewFolderView: View {
    
    @State var folderName: String
    @EnvironmentObject var model: FolderViweModel
    var body: some View {
        List {
            TextField("Enter the folder name",text: $folderName)
        }
        Button {
            model.addFolders(title: folderName)
        }label: {
            Text("Save")
        }
    }
}

#Preview {
    AddNewFolderView(folderName: "Notes", model: .init())
}
