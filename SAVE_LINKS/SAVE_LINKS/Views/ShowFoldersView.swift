//
//  ShowFoldersView.swift
//  SAVE_LINKS
//
//  Created by Brunda Basavarajappa on 13/03/24.
//

import SwiftUI

struct ShowFolderesView: View {
    
    @EnvironmentObject var folderModel: FolderViweModel
    @EnvironmentObject var model: SaveLinksViewModel
    var body: some View {
        
        NavigationView {
            List {
                ForEach(folderModel.folderItems) { items in
                   // Text(items.folderTitle)
                    NavigationLink(items.folderTitle, destination: FolderDetailView(folderName: items.folderTitle, viewModel: model))
                }
            }
            .navigationTitle("Folders")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("➕", destination: AddNewFolderView(folderName: "", model: .init()))
                }
            }
        }
        
    }
}

struct FolderDetailView: View {
    let folderName: String
    @ObservedObject var viewModel: SaveLinksViewModel
    var body: some View {
        VStack {

            Text("Links in \(folderName)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            List {
                ForEach(viewModel.linkItems) { item in
                    Text(item.title)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("➕",destination: AddLinkView(title: "", link: ""))
                }
            }
        }
    }
}

#Preview {
    ShowFolderesView(folderModel: .init(), model: .init())}

#Preview {
    FolderDetailView(folderName: "folders", viewModel: .init(linkItems: []))
}
