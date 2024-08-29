import SwiftUI
struct AddChore: View {
    
    @State private var choreName: String = ""
    @State private var choreDescription: String = ""
    @State var spacecnt: Int = 0
    @AppStorage("String_key") var savedName = ""
    @AppStorage("String_key") var savedDesp = ""
    @Binding var chorearray : [StoreChoreData]
    @State private var date: Date = Date()
    
    
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            TextField("Chore Name" ,text: $choreName, axis: .vertical)
                .disableAutocorrection(false)
                .textFieldStyle(.roundedBorder)
                .border(Color.black)
                .onChange(of: choreName){
                    self.savedName = choreName
                }
                .onAppear {
                    self.choreName = savedName
                }
            
            TextField("Chore Description" ,text: $choreDescription , axis: .vertical)
                .disableAutocorrection(false)
                .textFieldStyle(.roundedBorder)
                .lineLimit(2...7)
                .border(Color.glgreen)
            
                .onChange(of: choreDescription) {
                    spacecnt = choreDescription.filter { $0 == " " }.count
                }
            
            Text("\(spacecnt)/\(256)").frame(width:300,alignment: .trailing)
            
            DatePicker("Select a date", selection: $date, in: Date()... , displayedComponents: .date)
            Spacer()
            
            Button {
                chorearray.append(StoreChoreData(name: choreName, description: choreDescription))
                
            }label:{
                Text("Done")
            }
            
            
        }
        
        .navigationTitle("Add Chore")
        .padding(20)
        
        Button {
            choreName = ""
            choreDescription = ""
        }
        label : {
            Text("AddChore")
        }
    }
}


