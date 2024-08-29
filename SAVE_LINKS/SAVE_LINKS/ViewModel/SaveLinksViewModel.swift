//
//  SaveLinksViewModel.swift
//  SAVE_LINKS
//
//  Created by Brunda Basavarajappa on 24/03/24.
//

import Foundation

class SaveLinksViewModel: ObservableObject{
    
    @Published var linkItems = [Links]()
    
    init(linkItems: [Links] = [Links]()) {
        self.linkItems = linkItems
    }
    
    func addItems(title: String ,link: String){
        linkItems.append(.init(title: title, link: link))
    }
}
