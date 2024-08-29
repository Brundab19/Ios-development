//
//  FakeStoreApiApp.swift
//  FakeStoreApi
//
//  Created by Brunda Basavarajappa on 07/04/24.
//

import SwiftUI

@main
struct FakeStoreApiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(model: ProductViewModel())
        }
    }
}
