import SwiftUI

struct ContentView: View {
    
    @State var chorearray: [StoreChoreData] = [
        
        StoreChoreData(name : "cleanHouse", description: "CORRECTLY"/*, numberofchores: ["cleanHouse" , "cleanRoom"]*/),
        StoreChoreData(name: "cleanRoom", description: "CLEANLY" /*numberofchores: ["clean the room"]*/),
        StoreChoreData(name: "cleanBackyard", description: "PREFECTLY"
                      /*numberofchores: ["Clean the hall","Clean the dinning hall"]*/)
    ]
    
    @State private var flag: Bool = false
    var body: some View {
        
        NavigationStack {
            
            Header()
            
            //            List {
            //
            //                Section{
            //                    ShowChoreDetail(choreTitle: "🧹 Clean the house", choreRecurring: "Complete this task daily")
            //                    ShowChoreDetail(choreTitle: "🧹 Clean the room", choreRecurring: "Complete this task daily")
            //                }header: {
            //                    DisplayDate(dateText: "Sunday jan 1")
            //                }
            //
            //
            //                Section{
            //                    ShowChoreDetail(choreTitle: " 🧽 Clean the house", choreRecurring: "Complete this task weekly")
            //                }header: {
            //                    DisplayDate(dateText: "Monday jan 2")
            //                }
            //
            //                Section{
            //                    ShowChoreDetail(choreTitle: "🧽 Clean the house",choreRecurring: "Complete this task montly")
            //                }header: {
            //                    DisplayDate(dateText: "Tuesday jan 3")
            //                }
            //            }
            
            List {
                ForEach(chorearray) { i in
                    Section{
                        
                        Text(i.description)
//                        ForEach(i.numberofchores,id: \.self) { j in
//                            
//                            VStack{
//                                Text(j)
//                            }
//                        }

                    } header: {
                        Text(i.name)
                        
                    }
                }
            }
                Spacer()
                
            //AddChoreButton(text: "Add Chores")

                //            NavigationLink("Add Chores") {
                //                AddChore(chorearray: $chorearray)
                //            }
            Button(action: {
                
            }) {
                NavigationLink(destination:  AddChore(chorearray: $chorearray)) {
                    Text("Add chore")
                        .frame(width: 300,height: 50)
                        .background(Color.glgreen)
                        .foregroundColor(.white)
                        .font(.system(size: 20,weight: .bold,design: .default))
                        .cornerRadius(10)
                }
            }
        }
        
        Spacer()
        }
    }



#Preview {
    ContentView()
}
