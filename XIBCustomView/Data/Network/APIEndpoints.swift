//
//  APIEndpoints.swift
//  XIBCustomView
//
//  Created by Ahmad Hemeda on 01/04/2024.
//

import Foundation
import UtilityLibrary

struct APIEndpoints {
    static func getProducts() -> BaseAPIRequest<ProductAPIResponse>{
        let request = BaseAPIRequest<ProductAPIResponse>(
            baseURL: URL(string: "https://dummyjson.com")!,
            path: "/products",
            method: "GET"
        )
        return request
    }
}
