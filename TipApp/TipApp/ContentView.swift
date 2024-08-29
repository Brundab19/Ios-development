import SwiftUI

struct ContentView: View {
    @State private var amt: String = ""
    @State private var percentage: String = ""
    var body: some View {
        VStack(spacing:20){
            TextField("Enter the amount ", text: $amt)
                .background(Color.red)
            
            
            TextField("Enter the percentage",
                      text: $percentage)
            let ans = ((Int(amt) ?? 0)*(Int(percentage) ?? 0))/100
            Text("The tip is ") + Text("\(ans)").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
