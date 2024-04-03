import Foundation
import Combine

protocol ProductLocalDataSourceProtocol {
    func fetchData() -> AnyPublisher<[ProductEntity], Error>
    func saveProductsFromJSON(jsonData: Data)
}
