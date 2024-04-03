import Foundation
import Combine

protocol ProductLocalDataSourceProtocol {
    func fetchData() -> AnyPublisher<[ProductEntity], Error>
    func getProduct(withId id: Int) -> AnyPublisher<ProductEntity?, Error>
    func addNewProduct(title: String) -> AnyPublisher<Void, Error>
    func updateProduct(withId id: Int, title: String) -> AnyPublisher<Void, Error>
    func deleteProduct(withId id: Int) -> AnyPublisher<Void, Error>
    func saveProductsFromJSON(jsonData: Data)
}
