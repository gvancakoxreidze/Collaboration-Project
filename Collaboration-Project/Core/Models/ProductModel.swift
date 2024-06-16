//
//  ProductModel.swift
//  Collaboration-Project
//
//  Created by gvanca koxreidze on 15.06.24.
//

struct ProductModel: Codable {
    let id: Int
    let title: String
    let price: Double
    let category: String
    let stock: Int
    let thumbnail: String
    
}


struct ResponseModel: Codable {
    let products: [ProductModel]
    
}
