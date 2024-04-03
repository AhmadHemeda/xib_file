//import Foundation
//import Combine
//import UtilityLibrary
//
//class ProductLocalDataSource: ProductLocalDataSourceProtocol {
//    
//    private let coreDataStorageManager: CoreDataStorageManagerProtocol = CoreDataStorageManager.shared
//    
//    func fetchData() -> AnyPublisher<[ProductEntity], Error> {
//        return coreDataStorageManager.getAllProducts()
//    }
//    
//    func getProduct(withId id: Int) -> AnyPublisher<ProductEntity?, Error> {
//        coreDataStorageManager.getProduct(withId: id)
//    }
//    
//    func addNewProduct(title: String) -> AnyPublisher<Void, Error> {
//        coreDataStorageManager.addNewProduct(title: title)
//    }
//    
//    func updateProduct(withId id: Int, title: String) -> AnyPublisher<Void, Error> {
//        coreDataStorageManager.updateProduct(withId: id, title: title)
//    }
//    
//    func deleteProduct(withId id: Int) -> AnyPublisher<Void, Error> {
//        coreDataStorageManager.deleteProduct(withId: id)
//    }
//    
//    func saveProductsFromJSON(jsonData: Data) {
//        coreDataStorageManager.saveProductsFromJSON(jsonData: jsonData)
//    }
//}
