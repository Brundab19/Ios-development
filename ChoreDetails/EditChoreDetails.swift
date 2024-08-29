import SwiftUI

struct EditChoreDetails: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var chore: FetchedResults<ChoreDataModel>.Element
    
    @State private var choreName: String = ""
    @State private var choreDescription: String = ""
    @State var spacecnt: Int = 0
    @State private var date = Date()
    @State private var borderForName = false
    @State private var borderForDescription = false
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            TextField("\(chore.title!)" ,text: $choreName, axis: .vertical)
                .disableAutocorrection(false)
                .textFieldStyle(.roundedBorder)
                .overlay {
                    Rectangle()
                        .stroke(borderForName ? Color.glgreen : Color.glgray, lineWidth: 2)
                }
                .onAppear() {
                    choreName = chore.title!
                }
                .onTapGesture {
                    borderForName = true
                }
                
                
            TextField("Chore Description" ,text: $choreDescription , axis: .vertical)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .lineLimit(2...7)
                .background{
                    Rectangle()
                        .stroke(borderForDescription ? Color.glgreen : Color.glgray, lineWidth: 2)
                }
                .onAppear() {
                    choreDescription = chore.desp!
                }
                .onTapGesture {
                    borderForDescription = true
                }
            
                .onChange(of: choreDescription) {
                    spacecnt = choreDescription.filter { $0 == " " }.count
                }
            
            Text("\(spacecnt)/\(256)").frame(width:300,alignment: .trailing)
            
            DatePicker("Select a date", selection: $date, in: Date()... , displayedComponents: .date)

            
            Spacer()
        }
        .navigationTitle("Edit Chore")
        
        HStack {
            Spacer()
            Button("Done") {
                DataController().editChore(chores: chore, title: choreName, desp: choreDescription,date: date,context: managedObjContext)
                dismiss()
            }
            .frame(width: 300,height: 50)
            .background(Color.glgreen)
            .foregroundColor(.white)
            .font(.system(size: 20,weight: .bold,design: .default))
            .cornerRadius(10)
        
            Spacer()
        }
        
        HStack {
            
        }
    }
}


