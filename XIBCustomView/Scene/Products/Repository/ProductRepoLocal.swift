import Foundation
import Combine
import UtilityLibrary

class ProductRepoLocal: BaseRepository<[ProductEntity]> {
    private let coreDataStorageManager: CoreDataStorageManager = CoreDataStorageManager.shared
    
    override func fetchData() -> AnyPublisher<[ProductEntity], Error> {
        return coreDataStorageManager.getAllProducts()
    }
}
