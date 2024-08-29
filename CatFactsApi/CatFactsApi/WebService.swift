//
//  WebService.swift
//  CatFactsApi
//
//  Created by Brunda Basavarajappa on 18/02/24.
//

import Foundation

class WebService {
    
    
    func CatFactApiCall() async throws -> CatsFact{
        
        let urlString = "https://catfact.ninja/fact"
        
        guard let url = URL(string: urlString) else {
            print("Url not found")
            exit(0)
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            print(response)
            exit(0)
        }
        
        do {
            let decoder = JSONDecoder()
            return /*let resultOfApi */ try decoder.decode(CatsFact.self, from:data)
          //  return resultOfApi
        }
        catch {
            print(error)
            exit(0)
        }
        
    }
}

