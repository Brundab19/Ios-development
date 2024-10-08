import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var food: FetchedResults<Food>
    
    @State private var showingAddView = false
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Text("\(Int(totalCaloriesToday())) Kcal (Today) ")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                List {
                    ForEach(food) { food in
                        NavigationLink(destination: Text("\(food.calories)")) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6){
                                    Text(food.name!)
                                        .bold()
                                    
                                    Text("\(Int(food.calories))") +
                                    Text("calories").foregroundColor(.red)
                                }
                                
                                Spacer()
                            }
                        }
                    }
                    .onDelete(perform: deleteFood)
                }
                .listStyle(.plain)
            }
            .navigationTitle("iCalories")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        showingAddView.toggle()
//                    } label: {
//                        Label("Add Food",systemImage: "plus.circle")
//                    }
//                }
//                ToolbarItem(placement: .navigationBarLeading) {
//                    EditButton()
//                }
//            }
            .sheet(isPresented: $showingAddView) {
                AddFoodView()
            }
        }
    }
    
    private func deleteFood(offsets: IndexSet) {
        
    }
        private func totalCaloriesToday() -> Double {
        return 0.0
    }
}

#Preview {
    ContentView()
}
