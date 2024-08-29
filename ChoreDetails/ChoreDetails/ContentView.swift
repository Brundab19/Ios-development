import SwiftUI

class ChoresViewModel: ObservableObject {
    
    var dateForematter: DateFormatter {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        return dateFormat
    }
    
    var choreDisplay = [ChoreDataModel]()

    func fetchdata() {
        choreDisplay = DataController().getAllData()
    }
}

struct ContentView: View {
    
    @ObservedObject var viewModel: ChoresViewModel = .init()
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: []) var chore: FetchedResults<ChoreDataModel>
    
    var yourArray: [ChoreDataModel] {
        Array(chore)
    }
    
    var dateForematter: DateFormatter {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        return dateFormat
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Header()
                
                List {
                    ForEach (yourArray) { chores in
                        Section {
                            NavigationLink(destination: EditChoreDetails(chore: chores)) {
                            ShowChoreDetail(choreTitle: chores.title!, choreRecurring: "Complete this task daily")
                            }
                        }header: {
                            Text(dateForematter.string(from: chores.date!))
                        }
                    }.onDelete(perform: deleteChore)
                }
                
                Button(action: {
                    
                }) {
                    NavigationLink(destination:  AddChoreDetails()) {
                        Text("Add chore")
                            .frame(width: 300,height: 50)
                            .background(Color.glgreen)
                            .foregroundColor(.white)
                            .font(.system(size: 20,weight: .bold,design: .default))
                            .cornerRadius(10)
                    }
                }
            }
        }
    }

            private func deleteChore(offsets: IndexSet) {
                offsets.map { chore[$0] }.forEach(managedObjContext.delete)
                DataController().save(context: managedObjContext)
            }
        
    
}

#Preview {
    ContentView()
}


























//                Section {
//                    //                        NavigationLink(destination: EditChoreDetails(chore: chore)) {
//                    //                            ShowChoreDetail(choreTitle: chore.title!, choreRecurring: "Complete this task daily")
//                    //                        }
//                    //                        Logic(choreDisplay: )
//                }
//            header: {
//             //   Text(dateForematter.string(from: chore.date! ))
//            }
//                
//                
//            }//.onDelete(perform: deleteChore)
//        }
//    @Environment(\.managedObjectContext) var managedObjContext
//    @FetchRequest(sortDescriptors: []) var chore: FetchedResults<ChoreDataModel>
//    @State private var showingAddView = false
//    @State var choreDisplay: [ChoreDataModel]
