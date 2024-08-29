//
//  AddLinkView.swift
//  SAVE_LINKS
//
//  Created by Brunda Basavarajappa on 13/03/24.
//

import SwiftUI

struct AddLinkView: View {

    @State var title:String
    @State var link:String
    @EnvironmentObject var model: SaveLinksViewModel
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Enter the title",text:$title)
                TextField("Enter the Link",text: $link)
            }
            Button("Add Item") {
                model.addItems(title: title, link: link)
                title = ""
                link = ""
            }
        }
    }
}

#Preview {
    AddLinkView(title: "Toi", link: "https://timesofindia.indiatimes.com/", model: .init())
}
