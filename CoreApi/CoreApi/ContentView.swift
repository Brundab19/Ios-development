import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ChoreViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List (vm.chores) { chore in
                    Section {
                       // NavigationLink(destination: AddChore(name:chore.title)){
                            HStack {
                                Image(systemName: chore.isSelected ? "square.fill" : "square")
                                Text(chore.title)
                                Spacer()
                                ZStack {
                                    Circle()
                                        .frame(width: 30)
                                        .foregroundColor(.green)
                                    Image(systemName: "greaterthan")
                                        
                                    
                                }.background(NavigationLink("", destination:AddChore(name: chore.title)))
                                            
                        }
                    }header : {
                        Text("\(chore.id)")
                    }                }.background(Color.white)
                    .listStyle(.plain)
            }
            .padding()
            .task {
                await vm.getChores()
            }
                                             }
    }
}

#Preview {
    ContentView()
}
