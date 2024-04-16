import Foundation
import Combine
import UtilityLibrary

class RemoteProductRepository: RemoteProductRepositoryProtocol {
    private let apiRequestProvider: APIRequestProviderProtocol = APIRequestProvider.shared

    func fetchProducts<T: Decodable>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error> {
        apiRequestProvider.makeRequest(request: endpoint)
    }

    func getProduct<T: Decodable>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error> {
        apiRequestProvider.makeRequest(request: endpoint)
    }

    func addNewProduct<T: Decodable>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error> {
        apiRequestProvider.makeRequest(request: endpoint)
    }

    func updateProduct<T: Decodable>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error> {
        apiRequestProvider.makeRequest(request: endpoint)
    }

    func deleteProduct<T: Decodable>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error> {
        apiRequestProvider.makeRequest(request: endpoint)
    }
}
