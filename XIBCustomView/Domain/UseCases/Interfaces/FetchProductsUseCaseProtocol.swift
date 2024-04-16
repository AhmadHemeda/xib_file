import Foundation

protocol FetchProductsUseCaseProtocol {
    var delegate: FetchProductsUseCaseDelegate? { get set }

    func fetchProducts()
    func fetchProductsLocally()
}
