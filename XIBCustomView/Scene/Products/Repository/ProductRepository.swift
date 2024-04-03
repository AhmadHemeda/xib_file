import Foundation
import Combine

class ProductRepository: ProductRepositoryProtocol {
    
    
    private let productRemoteDataSource: ProductRemoteDataSourceProtocol
    private let productLocalDataSource: ProductLocalDataSourceProtocol
    
    init(productRemoteDataSource: ProductRemoteDataSourceProtocol, productLocalDataSource: ProductLocalDataSourceProtocol) {
        self.productRemoteDataSource = productRemoteDataSource
        self.productLocalDataSource = productLocalDataSource
    }
    
    // MARK: - Remote
    
    func fetchProductsRemotely() -> AnyPublisher<ProductAPIResponse, Error> {
        productRemoteDataSource.fetchData()
    }
    
    func fetchProductRemotely(withId id: Int) -> AnyPublisher<Product, Error> {
        productRemoteDataSource.getProduct(withId: id)
    }
    
    func addNewProductRemotely(title: String) -> AnyPublisher<Product, Error> {
        return productRemoteDataSource.addNewProduct(title: title)
    }
    
    func updateProductRemotely(withId id: Int, title: String) -> AnyPublisher<Product, Error> {
        productRemoteDataSource.updateProduct(withId: id, title: title)
    }
    
    func deleteProductRemotely(withId id: Int) -> AnyPublisher<Product, Error> {
        productRemoteDataSource.deleteProduct(withId: id)
    }
    
    // MARK: - Local
    
    func fetchProductsLocally() -> AnyPublisher<[ProductEntity], Error> {
        productLocalDataSource.fetchData()
    }
    
    func saveProductsFromJSON(jsonData: Data) {
        productLocalDataSource.saveProductsFromJSON(jsonData: jsonData)
    }
}
