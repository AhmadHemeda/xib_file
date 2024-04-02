//
//  APIEndpoints.swift
//  XIBCustomView
//
//  Created by Ahmad Hemeda on 01/04/2024.
//

import Foundation
import UtilityLibrary

struct APIEndpoints {
    static func getProducts() -> BaseAPIRequest<ProductAPIResponse> {
        let request = BaseAPIRequest<ProductAPIResponse>(
            baseURL: URL(string: "https://dummyjson.com")!,
            path: "/products",
            method: "GET"
        )
        return request
    }
    
    static func getProduct(withId id: Int) -> BaseAPIRequest<Product> {
        let request = BaseAPIRequest<Product>(
            baseURL: URL(string: "https://dummyjson.com")!,
            path: "/products/\(id)",
            method: "GET"
        )
        return request
    }
    
    static func addNewProduct(title: String) -> BaseAPIRequest<Product> {
        let bodyDict = ["title": title]
        let bodyData = try? JSONSerialization.data(withJSONObject: bodyDict)
        let headers = ["Content-Type": "application/json"]
        let request = BaseAPIRequest<Product>(
            baseURL: URL(string: "https://dummyjson.com")!,
            path: "/products/add",
            method: "POST",
            headers: headers,
            body: bodyData
        )
        return request
    }

    static func updateProduct(withId id: Int, title: String) -> BaseAPIRequest<Product> {
        let bodyDict = ["title": title]
        let bodyData = try? JSONSerialization.data(withJSONObject: bodyDict)
        let headers = ["Content-Type": "application/json"]
        let request = BaseAPIRequest<Product>(
            baseURL: URL(string: "https://dummyjson.com")!,
            path: "/products/\(id)",
            method: "PUT",
            headers: headers,
            body: bodyData
        )
        return request
    }
    
    static func deleteProduct(withId id: Int) -> BaseAPIRequest<Product> {
        let request = BaseAPIRequest<Product>(
            baseURL: URL(string: "https://dummyjson.com")!,
            path: "/products/\(id)",
            method: "DELETE"
        )
        return request
    }
}
