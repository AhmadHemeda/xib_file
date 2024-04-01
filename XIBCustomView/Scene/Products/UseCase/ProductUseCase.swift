import Foundation
import Combine
import UtilityLibrary

class ProductUseCase: BaseUseCase<Void, ProductAPIResponse> {
    private let repository: ProductRepo = ProductRepo()
    
    override func execute(requestData: Void) -> AnyPublisher<ProductAPIResponse, Error> {
        return repository.fetchData()
    }
}
