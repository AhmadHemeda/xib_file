import Foundation
import Combine

protocol ProductUseCaseProtocol {
    
    func fetchProductsRemotely() -> AnyPublisher<ProductAPIResponse, Error>
    func fetchProductRemotely(withId id: Int) -> AnyPublisher<Product, Error>
    func addNewProductRemotely(title: String) -> AnyPublisher<Product, Error>
    func updateProductRemotely(withId id: Int, title: String) -> AnyPublisher<Product, Error>
    func deleteProductRemotely(withId id: Int) -> AnyPublisher<Product, Error>
    
    func fetchProductsLocally() -> AnyPublisher<[ProductEntity], Error>
    func saveProductsFromJSON(jsonData: Data)
}
