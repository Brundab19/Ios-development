//
//  Model.swift
//  FakeStoreApi
//
//  Created by Brunda Basavarajappa on 07/04/24.
//

import Foundation

public struct ProductModel: Identifiable{
    public var id = UUID()
    var title: String
    var price: Double
    var description: String
    var category: String
    var rating: Rate
}

public struct Rate {
    var rate: Float
    var count: Int
}
