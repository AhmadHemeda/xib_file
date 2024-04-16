import Foundation

protocol FetchProductsUseCaseDelegate: AnyObject {
    func productsFetchedRemotely(_ products: ProductAPIResponse)
    func productsFetchedLocally(_ products: [ProductEntity])
    func fetchProductsFailed(withError error: Error)
}
