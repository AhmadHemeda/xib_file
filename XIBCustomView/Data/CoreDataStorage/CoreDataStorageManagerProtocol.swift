import Foundation
import Combine
import CoreData

protocol CoreDataStorageManagerProtocol {
    var managedObjectContext: NSManagedObjectContext { get }
    
    func saveProductsFromJSON(response: ProductAPIResponse)
    func getAllProducts() -> AnyPublisher<[ProductEntity], Error>
    func getProduct(response: ProductAPIResponse) -> AnyPublisher<ProductEntity?, Error>
    func addNewProduct(response: ProductAPIResponse) -> AnyPublisher<ProductEntity, Error>
    func updateProduct(response: ProductAPIResponse) -> AnyPublisher<ProductEntity, Error>
    func deleteProduct(response: ProductAPIResponse) -> AnyPublisher<ProductEntity, Error>
}
