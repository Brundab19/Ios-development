//
//  GalleryViewModel.swift
//  Hackathon
//
//  Created by Chandan Kasamsetty on 22/06/24.
//

import Foundation
import SwiftUI
@MainActor
final class GalleryViewModel: ObservableObject{
    @Published var imageResponse : ImageCategories? = nil
    @Published private(set) var isRefreshing = false
    
    func fetchCategories() async throws {
        // URL for the API endpoint
        isRefreshing = true
        defer { isRefreshing =  false}
        do{
            let url = URL(string: "http://127.0.0.1:8080/api/hackathon/categories")!

            // Create a URLRequest object and set the HTTP method to GET
            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            // Set the required headers
            request.setValue("TestCorrelationTitleValue", forHTTPHeaderField: "Correlation-Id")
            request.setValue("eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJhczIzNGgyMzNqNDUwODdsa2phc2xramZsYWtzZGYyMzQyM0AjJEAjJEAjJEAjIjozMTEyNzY5LCJhczIzNGgyMzNqNDUwODdsa2phc2xramZsYWtzZGYyMzQyM0AjJEAjJEAjJEAjMiI6InBhcmVudCIsImFzMjM0aDIzM2o0NTA4N2xramFzbGtqZmxha3NkZjIzNDIzQCMkQCMkQCMkQCM0IjoiMy4xMzcuOTguNzAiLCJhczIzNGgyMzNqNDUwODdsa2phc2xramZsYWtzZGYyMzQyM0AjJEAjJEAjJEAjMyI6WzE5Mzk3MjldLCJhczIzNGgyMzNqNDUwODdsa2phc2xramZsYWtzZGYyMzQyM0AjJEAjJEAjJEAjNSI6MTE3MjkxMSwiYXMyMzRoMjMzajQ1MDg3bGtqYXNsa2pmbGFrc2RmMjM0MjNAIyRAIyRAIyRAIzYiOiI3ODdiMjYwMC1kMmJhLTExZWQtOGU3MS0wOTM0MTc3YWI3NmEiLCJpYXQiOjE3MDQ5OTA3MTEsImV4cCI6MTcwNDk5NzkxMX0.3LuAdPQhAFN1KufzZWacDpUFjcdCLZ7LO866lmqmRBlCvsgkcnu18gm2Ng3r-yoC", forHTTPHeaderField: "Authorization")

            // Perform the API request using URLSession
            let (data, response) = try await URLSession.shared.data(for: request)

            // Check the response status code
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw UserError.failedToDecode
            }

            // Decode the JSON response
            let decoder = JSONDecoder()
            self.imageResponse = try decoder.decode(ImageCategories.self, from: data)
            
        } catch{
            let decoder = JSONDecoder()
            self.imageResponse = try decoder.decode(ImageCategories.self, from: mockResponse)
            
        }
        
    }

}

extension GalleryViewModel {
    enum UserError: LocalizedError {
        case custom(error: Error)
        case failedToDecode
        case invalidStatusCode
        
        var errorDescription: String? {
            switch self {
            case .failedToDecode:
                return "Failed to decode response"
            case .custom(let error):
                return error.localizedDescription
            case .invalidStatusCode:
                return "Invalid Status code isn't within a valid range"
            }
        }
    }
}

// Define the data model for the expected JSON response
struct ImageCategories: Codable, Hashable {
    let categories: [String: [String]]

    // Custom initializer to handle dynamic keys
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicKey.self)
        var categories = [String: [String]]()

        for key in container.allKeys {
            let images = try container.decode([String].self, forKey: key)
            categories[key.stringValue] = images
        }

        self.categories = categories
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DynamicKey.self)
        for (key, images) in categories {
            try container.encode(images, forKey: DynamicKey(stringValue: key)!)
        }
    }
}

// Define a struct to handle dynamic keys
struct DynamicKey: CodingKey {
    var stringValue: String
    var intValue: Int?

    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
}



//class ImageViewModel: ObservableObject {
//    @Published var image: UIImage?
//
//    private var imageCache: NSCache<NSString, UIImage>?
//
//    init(urlString: String?) {
//        loadImage(urlString: urlString)
//    }
//
//    private func loadImage(urlString: String?) {
//        guard let urlString = urlString else { return }
//
//        if let imageFromCache = getImageFromCache(from: urlString) {
//            self.image = imageFromCache
//            return
//        }
//
//        loadImageFromURL(urlString: urlString)
//    }
//
//    private func loadImageFromURL(urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard error == nil else {
//                print(error ?? "unknown error")
//                return
//            }
//
//            guard let data = data else {
//                print("No data found")
//                return
//            }
//
//            DispatchQueue.main.async { [weak self] in
//                guard let loadedImage = UIImage(data: data) else { return }
//                self?.image = loadedImage
//                self?.setImageCache(image: loadedImage, key: urlString)
//            }
//        }.resume()
//    }
//
//    private func setImageCache(image: UIImage, key: String) {
//        imageCache?.setObject(image, forKey: key as NSString)
//    }
//
//    private func getImageFromCache(from key: String) -> UIImage? {
//        return imageCache?.object(forKey: key as NSString) as? UIImage
//    }
//}

// Define a function to perform the API request and decode the response
