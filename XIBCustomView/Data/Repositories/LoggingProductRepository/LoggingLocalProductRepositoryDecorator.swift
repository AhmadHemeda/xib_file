import Foundation
import Combine
/*
class LoggingLocalProductRepositoryDecorator: LocalProductRepositoryProtocol {
    private let repository: LocalProductRepositoryProtocol

    init(repository: LocalProductRepositoryProtocol) {
        self.repository = repository
    }

    func fetchProductsLocally() -> AnyPublisher<[ProductEntity], Error> {
        logFetchProductsLocally()
        return repository.fetchProductsLocally()
    }

    func getProductLocally(with product: ProductAPIResponse) -> AnyPublisher<ProductEntity?, any Error> {
        logFetchProductsLocally()
        return repository.getProductLocally(with: product)
    }

    func addNewProductLocally(with product: ProductAPIResponse) -> AnyPublisher<ProductEntity, any Error> {
        logFetchProductsLocally()
        return repository.addNewProductLocally(with: product)
    }

    func updateProductLocally(with product: ProductAPIResponse) -> AnyPublisher<ProductEntity, any Error> {
        logFetchProductsLocally()
        return repository.updateProductLocally(with: product)
    }

    func deleteProductLocally(with product: ProductAPIResponse) -> AnyPublisher<ProductEntity, any Error> {
        logFetchProductsLocally()
        return repository.deleteProductLocally(with: product)
    }

    func saveProductsFromJSON(with product: ProductAPIResponse) {
        logFetchProductsLocally()
        return repository.saveProductsFromJSON(with: product)
    }

    private func logFetchProductsLocally() {
        print("Logging local fetch products request")
    }
}
*/
