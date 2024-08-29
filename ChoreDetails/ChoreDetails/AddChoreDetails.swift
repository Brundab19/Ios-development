import SwiftUI

struct AddChoreDetails: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var choreName: String = ""
    @State private var choreDescription: String = ""
    @State var spacecnt: Int = 0
    @State private var date = Date()
    @State private var borderForName = false
    @State private var borderForDescription = false
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            TextField("Chore Name" ,text: $choreName, axis: .vertical)
                .disableAutocorrection(false)
                .textFieldStyle(.roundedBorder)
                .background(
                    Rectangle()
                        .stroke(borderForName ? Color.green : Color.gray, lineWidth: 2)
                )
                .onTapGesture {
                    borderForName = true
                }
                
            TextField("Chore Description" ,text: $choreDescription , axis: .vertical)
                .disableAutocorrection(false)
                .textFieldStyle(.roundedBorder)
                .lineLimit(2...7)
                .background{
                    Rectangle()
                        .stroke(borderForDescription ? Color.green : Color.gray, lineWidth: 2)
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
        .navigationTitle("Add Chore")
        .padding(20)
        
        HStack {
            Spacer()
            Button("Done") {
                DataController().addChore(title: choreName, desp: choreDescription,date: date,context: managedObjContext)
                dismiss()
            }
            .frame(width: 300,height: 50)
            .background(Color.glgreen)
            .foregroundColor(.white)
            .font(.system(size: 20,weight: .bold,design: .default))
            .cornerRadius(10)
        
            Spacer()
        }
    }

}

#Preview {
    AddChoreDetails()
}

