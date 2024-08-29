import SwiftUI

struct AddChoreButton: View {
    var body: some View {
        
        Button {
            print("Tapped")
        }
        
        label:{
            
        Text("Add chores")
            .frame(width: 300,height: 50)
            .background(Color.glgreen)
            .foregroundColor(.black)
            .font(.system(size: 20,weight: .bold,design: .default))
            .cornerRadius(10)
        }
        
    }
}

#Preview {
    AddChoreButton()
}
