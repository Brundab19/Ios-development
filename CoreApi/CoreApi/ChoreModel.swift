import Foundation

struct Item: Identifiable, Codable {
    let title: String
    let isSelected: Bool
    let id: Int
}

struct ChoreModel: Codable {
    let items: [Item]
}
