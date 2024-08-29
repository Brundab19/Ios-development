//
//  ViewModel.swift
//  FakeStoreApi
//
//  Created by Brunda Basavarajappa on 07/04/24.
//

import Foundation

class ProductViewModel: ObservableObject{
    
    var productsArray: [ProductModel] = [ProductModel(title: "Shirt", price: 4.5, description: "Cotton shirt ", category: "Mens", rating: Rate(rate: 5, count: 5))]
    
}
