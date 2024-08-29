import SwiftUI

@main
struct ChoreDetailsApp: App {
    
    @StateObject private var dataController = DataController()
    @FetchRequest(sortDescriptors: []) var chore: FetchedResults<ChoreDataModel>
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

//var yourArray: [ChoreDataModel] {
////        Array(chore)
////    }
