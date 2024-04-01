import Foundation
import Combine
import UtilityLibrary

class ProductRepo: BaseRepository<ProductAPIResponse> {
    private let apiRequestProvider: APIRequestProviderProtocol = APIRequestProvider.shared
    
    override func fetchData() -> AnyPublisher<ProductAPIResponse, Error> {
        return apiRequestProvider.makeRequest(request: APIEndpoints.getProducts())
    }
}
