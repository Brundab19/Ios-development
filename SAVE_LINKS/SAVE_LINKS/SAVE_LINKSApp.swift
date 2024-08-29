//
//  SAVE_LINKSApp.swift
//  SAVE_LINKS
//
//  Created by Brunda Basavarajappa on 12/03/24.
//

import SwiftUI

@main
struct SAVE_LINKSApp: App {
    let viewModel = FolderViweModel()
    let saveLinkViewModel = SaveLinksViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(saveLinkViewModel)
        }
    }
}
