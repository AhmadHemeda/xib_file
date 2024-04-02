import Foundation
import Combine
import UtilityLibrary

class ProductRepoLocal: BaseRepository<[ProductEntity]> {
    private let coreDataStorageManager: CoreDataStorageManagerProtocol = CoreDataStorageManager.shared
    
    override func fetchData() -> AnyPublisher<[ProductEntity], Error> {
        return coreDataStorageManager.getAllProducts()
    }
    
    func saveProductsFromJSON(jsonData: Data) {
        coreDataStorageManager.saveProductsFromJSON(jsonData: jsonData)
    }
}
