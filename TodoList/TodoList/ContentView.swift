import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing:20) {
                Rectangle().frame(height: 30).foregroundColor(.white)
                VStack {
                    ForEach(vm.arrayOfTask, id: \.self) { task in
                        HStack {
                            Image(systemName: "square")
                            Text(task)
                        }
                        .onTapGesture {
                            vm.arrayOfTask.remove(at: vm.cnt)
                        }
                    }
                }.frame(width:390,alignment: .leading)
                    
                Spacer()
                Button(action: {
                
                }){
                    NavigationLink( destination: AddToList(/*taskName: $vm.taskName , arrayOfTask: $vm.arrayOfTask*/vm: vm)) {
                        Text("Add to list")
                            .font(.title)
                            .frame(width: 250, height: 40)
                            .background(Color.pink)
                            .padding()
                    }
                }
                
            }.navigationTitle("TodoList 📋")
            
        }
    }
}

#Preview {
    ContentView()
}
