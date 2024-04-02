import Foundation
import Combine
import UtilityLibrary

class ProductUseCase: BaseUseCase<Void, ProductAPIResponse> {
    private let repository: ProductRepo = ProductRepo()
    
    override func execute(requestData: Void) -> AnyPublisher<ProductAPIResponse, Error> {
        return repository.fetchData()
    }
    
//    func getProducts() -> AnyPublisher<ProductAPIResponse, Error> {
//        repository.fetchData()
//    }
    
    func getProduct(withId id: Int) -> AnyPublisher<Product, Error> {
        return repository.getProduct(withId: id)
    }
    
    func addNewProduct(title: String) -> AnyPublisher<Product, Error> {
        print("ProductUseCaseRemote: Executing addNewProduct")
        return repository.addNewProduct(title: title)
    }
    
    func updateProduct(withId id: Int, title: String) -> AnyPublisher<Product, Error> {
        return repository.updateProduct(withId: id, title: title)
    }
    
    func deleteProduct(withId id: Int) -> AnyPublisher<Product, Error> {
        return repository.deleteProduct(withId: id)
    }
}
