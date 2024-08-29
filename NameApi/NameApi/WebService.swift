import Foundation

class WebService {

    static let web = WebService()
    var urlstring1: String = ""
    let temp = 5
    
    func getData() async throws -> Item {
    
        var urlComponent = URLComponents(string: "https://api.genderize.io")
        urlComponent?.queryItems = [.init(name: "name", value: urlstring1)]
        
        guard let url = urlComponent?.url 
        else {
            throw ErrorCases.invalidURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
//        print(String(data: data, encoding: .utf8))
           
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            print(response)
            throw ErrorCases.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Item.self, from:data)
        }
        catch {
            print(error)
            throw ErrorCases.invalidData
        }
    
    }
    

    enum ErrorCases: LocalizedError {
        case invalidURL
        case invalidResponse
        case invalidData
        
        var errorDescription: String? {
            switch self {
            case .invalidURL:
                return "Invalid URL found"
                
            case .invalidResponse:
                return "Invalid response"
                
            case .invalidData:
                return "Invalid data found"
                
            
            }
        }
    }
}
