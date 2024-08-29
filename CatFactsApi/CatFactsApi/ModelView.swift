import Foundation

class ModelView: ObservableObject{

    func ReceiveApiCall() async -> CatsFact{
        do {
            let fact = try await WebService().CatFactApiCall()
            return fact
        }
        catch {
            print(error.localizedDescription)
            exit(0)
        }
    }
}
