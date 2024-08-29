import Foundation

class ViewModel : ObservableObject{
    
    @Published var taskName: String = ""
    @Published var arrayOfTask = [String]()
    @Published var cnt:Int = 0
    
    func addToArray() {
        arrayOfTask.append(taskName)
    }
}
