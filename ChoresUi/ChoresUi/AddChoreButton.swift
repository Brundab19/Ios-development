import SwiftUI

struct AddChoreButton: View {
    var text: String
    var body: some View {
        
    Button {
            
        }
        label:{
        Text(text)
            .frame(width: 300,height: 50)
            .background(Color.glgreen)
            .foregroundColor(.white)
            .font(.system(size: 20,weight: .bold,design: .default))
            .cornerRadius(10)
        }
    }
}

#Preview {
    AddChoreButton(text: "Add chores")
}

