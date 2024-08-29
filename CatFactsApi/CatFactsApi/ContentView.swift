import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = ModelView()
    
    @State var initialText = "Cats Facts"
    var body: some View {
        VStack {
            Text(initialText)
        }
        Button("Click to know more"){
            Task {
                let catFact = await vm.ReceiveApiCall()
                initialText = catFact.fact
            }
        }
    }
}

#Preview {
    ContentView()
}
