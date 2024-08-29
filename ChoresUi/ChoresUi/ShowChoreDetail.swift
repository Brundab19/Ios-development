import SwiftUI

struct ShowChoreDetail: View {
    
    var choreTitle: String
    var choreRecurring: String
    @State var isComplete = false
    
    var body: some View {
        
        VStack{
            HStack {
                
                Image(systemName: isComplete ? "checkmark.square.fill" : "square")
                    .font(.system(size: 30))
                    .opacity(0.5)
                    .onTapGesture {
                        isComplete.toggle()
                    }
                Spacer()
                
                ZStack{
                    
                    HStack{
                        
                        Text(choreTitle)
                            .font(.system(size: 20, weight: .medium))
                        
                        Spacer()
                    }
                    
                    Image(systemName: isComplete ? "minus" : "" )
                        .resizable()
                        .opacity(0.8)
                        .frame(width: 200, height: 3)
                }
                
                HStack {
                    Spacer()
                    Image(systemName: "arrow.triangle.2.circlepath")
                        .foregroundColor(.glgreen)
                        .font(.system(size: 20))
                    
                    Image(systemName: "ellipsis.circle.fill")
                        .font(.system(size: 20))
                }
            }
            .frame(width: 320 ,height: 40)
            
            Text(isComplete ? "Complete" : choreRecurring)
        }
        .frame(width: 390)
        
    }
}

#Preview {
    ShowChoreDetail(choreTitle: "Clean the house", choreRecurring: "Complete the task daily")
}

#Preview {
    ContentView()
}

