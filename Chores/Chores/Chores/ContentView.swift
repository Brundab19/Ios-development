import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: []) var chore: FetchedResults<ChoreDataModel>
    @State private var showingAddView = false
    
    var dateForematter: DateFormatter {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        return dateFormat
    }
    
    var body: some View {
        
        
        NavigationStack{
            
            Header()
            
            List {
                ForEach(chore) { chore in
                    Section {
                        ShowChoreDetail(choreTitle: chore.desp!, choreRecurring: "Complete this task daily")
                    }
                    header: {
                        Text(dateForematter.string(from: chore.date! ))
                    }
                }
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

#Preview {
    ContentView()
}

