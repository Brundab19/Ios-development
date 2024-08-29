//import SwiftUI
//import CoreData
//
////struct ChoreData: Identifiable {
////    
////    let id = UUID()
////    let title: String
////    let chores: [ChoreDataModel]
////    
////    init(title: String, chores: [ChoreDataModel]) {
////        self.title = title
////        self.chores = chores
////    }
////    
////}
//
//
//
//struct Logic: View {
//    
////    @Environment(\.managedObjectContext) var managedObjContext
////    @FetchRequest(sortDescriptors: []) var chore : FetchedResults<ChoreDataModel>
////    @Environment(\.dismiss) var dismiss
////    @State var choreDisplay: [ChoreDataModel]
//    
//    var body: some View {
//        
//        VStack {
//            
//        }.onAppear(perform: {
//            choreDisplay = DataController().getAllData()
//        })
//        
//        ForEach (choreDisplay) { choreit in
//            Text("\(choreit.title!)")
//            Text("\(choreit.date!)")
//            Text("\(choreit.desp!)")
//        }
//    }
//}
//
//
