import Foundation
import Combine

class LocalProductRepository: LocalProductRepositoryProtocol {
    private let coreDataStorageManager: CoreDataStorageManagerProtocol = CoreDataStorageManager.shared

    func fetchProductsLocally() -> AnyPublisher<[ProductEntity], Error> {
        coreDataStorageManager.getAllProducts()
    }

    func getProductLocally(with product: ProductAPIResponse) -> AnyPublisher<ProductEntity?, Error> {
        coreDataStorageManager.getProduct(response: product)
    }

    func addNewProductLocally(with product: ProductAPIResponse) -> AnyPublisher<ProductEntity, Error> {
        coreDataStorageManager.addNewProduct(response: product)
    }

    func updateProductLocally(with product: ProductAPIResponse) -> AnyPublisher<ProductEntity, Error> {
        coreDataStorageManager.updateProduct(response: product)
    }

    func deleteProductLocally(with product: ProductAPIResponse) -> AnyPublisher<ProductEntity, Error> {
        coreDataStorageManager.deleteProduct(response: product)
    }

    func saveProductsFromJSON(with product: ProductAPIResponse) {
        coreDataStorageManager.saveProductsFromJSON(response: product)
    }
}
