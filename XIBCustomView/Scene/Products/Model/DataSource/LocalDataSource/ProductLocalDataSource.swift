import Foundation
import Combine
import UtilityLibrary

class ProductLocalDataSource: ProductLocalDataSourceProtocol {
    private let coreDataStorageManager: CoreDataStorageManagerProtocol = CoreDataStorageManager.shared
    
    func fetchData() -> AnyPublisher<[ProductEntity], Error> {
        return coreDataStorageManager.getAllProducts()
    }
    
    func saveProductsFromJSON(jsonData: Data) {
        coreDataStorageManager.saveProductsFromJSON(jsonData: jsonData)
    }
}
