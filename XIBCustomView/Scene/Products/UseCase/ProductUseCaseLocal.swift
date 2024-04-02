import Foundation
import Combine
import UtilityLibrary

class ProductUseCaseLocal: BaseUseCase<Void, [ProductEntity]> {
    private let repository: ProductRepoLocal = ProductRepoLocal()
    
    override func execute(requestData: Void) -> AnyPublisher<[ProductEntity], Error> {
        return repository.fetchData()
    }
    
    func saveProductsFromJSON(jsonData: Data) {
        repository.saveProductsFromJSON(jsonData: jsonData)
    }
}
