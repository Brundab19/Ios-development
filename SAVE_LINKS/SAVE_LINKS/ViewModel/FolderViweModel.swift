//
//  FolderViweModel.swift
//  SAVE_LINKS
//
//  Created by Brunda Basavarajappa on 24/03/24.
//

import Foundation

class FolderViweModel:ObservableObject {
    
    @Published var folderItems = [FolderModel]()
    
    func addFolders(title: String) {
        folderItems.append(.init(folderTitle: title))
    }
}
