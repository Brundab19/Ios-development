import Foundation

class ChoreViewModel: ObservableObject { 
    
    @Published var chores = [Item]() 
    
    @MainActor
    func getChores () async {
       
        do {
            let chores = try await WebService().getChoresData()
            self.chores = chores
            
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
}
