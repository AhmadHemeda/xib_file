//
//  Product.swift
//  XIBCustomView
//
//  Created by Ahmad Hemeda on 01/04/2024.
//

import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}

struct ProductAPIResponse: Codable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}
