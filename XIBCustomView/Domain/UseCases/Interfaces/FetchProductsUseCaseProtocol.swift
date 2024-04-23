import Foundation

protocol FetchProductsUseCaseProtocol {
    var productsRemoteResponse: (
        (
            ProductAPIResponse?
        ) -> Void
    )? {
        get set
    }

    var productsLocalResponse: (
        (
            [ProductEntity]?
        ) -> Void
    )? {
        get set
    }

    var error: (
        (
            Error?
        ) -> Void
    )? {
        get set
    }

    func fetchProducts()
    func fetchProductsLocally()
}
