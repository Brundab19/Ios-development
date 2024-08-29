import SwiftUI

struct Header: View {
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .frame(width: 400, height: 270)
                .foregroundColor(.glgray)
                .ignoresSafeArea(.all)
            
            HStack {
                
                Text("Chores")
                    .font(.system(size: 50 ))
                    .frame(height: 100 ,alignment:.bottom)
                Spacer()
                
            }.padding()
            
        }
    }
}

#Preview {
    Header()
}

