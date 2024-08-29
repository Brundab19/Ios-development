import SwiftUI

struct ContentView: View {
    
    @State var name = ""
    @State private var Gender: Item?

    var body: some View {
        VStack {
            TextField("name",text:$name)
            Text("The gender is \(Gender?.gender ?? "helo")")
                        
            Button {
                WebService.web.urlstring1 = name
                Task {
                    do {
                        Gender = try await WebService.web.getData()
                        print(Gender?.gender ?? "hello")
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }label: {
                Text("Submit")
            }
            
                
        }
        .padding()
//        .task {
//            wb.urlstring1 = name
//            do {
//                
//                Gender = try await wb.getData()
//                print(Gender?.gender ?? "hello")
//            }
//            catch {
//                print(error.localizedDescription)
//            }
//            
//        }
    }
}

#Preview {
    ContentView()
}
