import Foundation
import UtilityLibrary

struct APIEndpoint {
    private static let baseURL = URL(
        string: "https://dummyjson.com"
    )!
    private static let commonHeaders = ["Content-Type": "application/json"]
    
    private static func makeURLPath(
        _ pathComponent: String
    ) -> String {
        return "/\(pathComponent)"
    }
    
    private static func makeRequestBody(
        withTitle title: String
    ) -> Data? {
        let bodyDict = ["title": title]
        return try? JSONEncoder().encode(
            bodyDict
        )
    }

    static func getProducts() -> BaseAPIRequest<ProductAPIResponse> {
        return BaseAPIRequest(
            baseURL: baseURL,
            path: makeURLPath(
                "products"
            ),
            method: .get
        )
    }

    static func getProduct(
        withId id: Int
    ) -> BaseAPIRequest<Product> {
        return BaseAPIRequest(
            baseURL: baseURL,
            path: makeURLPath(
                "products/\(id)"
            ),
            method: .get
        )
    }

    static func addNewProduct(
        title: String
    ) -> BaseAPIRequest<Product> {
        return BaseAPIRequest(
            baseURL: baseURL,
            path: makeURLPath(
                "products/add"
            ),
            method: .post,
            headers: commonHeaders,
            body: makeRequestBody(
                withTitle: title
            )
        )
    }

    static func updateProduct(
        withId id: Int,
        title: String
    ) -> BaseAPIRequest<Product> {
        return BaseAPIRequest(
            baseURL: baseURL,
            path: makeURLPath(
                "products/\(id)"
            ),
            method: .put,
            headers: commonHeaders,
            body: makeRequestBody(
                withTitle: title
            )
        )
    }

    static func deleteProduct(
        withId id: Int
    ) -> BaseAPIRequest<Product> {
        return BaseAPIRequest(
            baseURL: baseURL,
            path: makeURLPath(
                "products/\(id)"
            ),
            method: .delete
        )
    }
}
