import Foundation
import Combine
import UtilityLibrary

class ProductUseCase: ProductUseCaseProtocol {
    
    private let repository: ProductRepositoryProtocol = ProductRepository(
        productRemoteDataSource: ProductRemoteDataSource(),
        productLocalDataSource: ProductLocalDataSource()
    )
    
    func fetchProductsRemotely() -> AnyPublisher<ProductAPIResponse, any Error> {
        repository.fetchProductsRemotely()
    }
    
    func fetchProductRemotely(withId id: Int) -> AnyPublisher<Product, any Error> {
        repository.fetchProductRemotely(withId: id)
    }
    
    func addNewProductRemotely(title: String) -> AnyPublisher<Product, any Error> {
        repository.addNewProductRemotely(title: title)
    }
    
    func updateProductRemotely(withId id: Int, title: String) -> AnyPublisher<Product, any Error> {
        repository.updateProductRemotely(withId: id, title: title)
    }
    
    func deleteProductRemotely(withId id: Int) -> AnyPublisher<Product, any Error> {
        repository.deleteProductRemotely(withId: id)
    }
    
    func fetchProductsLocally() -> AnyPublisher<[ProductEntity], any Error> {
        repository.fetchProductsLocally()
    }
    
    func fetchProductLocally(withId id: Int) -> AnyPublisher<ProductEntity?, Error> {
        repository.fetchProductLocally(withId: id)
    }
    
    func addNewProductLocally(title: String) -> AnyPublisher<Void, Error> {
        repository.addNewProductLocally(title: title)
    }
    
    func updateProductLocally(withId id: Int, title: String) -> AnyPublisher<Void, Error> {
        repository.updateProductLocally(withId: id, title: title)
    }
    
    func deleteProductLocally(withId id: Int) -> AnyPublisher<Void, Error> {
        repository.deleteProductLocally(withId: id)
    }
    
    func saveProductsFromJSON(jsonData: Data) {
        repository.saveProductsFromJSON(jsonData: jsonData)
    }
}
