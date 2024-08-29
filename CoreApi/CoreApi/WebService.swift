import Foundation

class WebService {
    
    func getChoresData() async throws -> [Item] {
        
        let urlString = "https://demo0565616.mockable.io/"
        
        guard let url = URL(string: urlString)
        else {
            throw ErrorCases.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
      //  print(String(data:data,encoding:.utf8))
    
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw ErrorCases.invalidResponse
        }
        
        do {
            let decoded = try JSONDecoder().decode(ChoreModel.self, from: data)
            return decoded.items
            
        } catch {
            print(error)
            throw ErrorCases.invalidData
        }
        
    }
}


