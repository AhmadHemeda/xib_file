import Foundation
import UtilityLibrary
import Combine
/*
class LoggingRemoteProductRepositoryDecorator: RemoteProductRepositoryProtocol {
    private let repository: RemoteProductRepositoryProtocol

    init(repository: RemoteProductRepositoryProtocol) {
        self.repository = repository
    }

    func fetchProducts<T: Decodable>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error> {
        logRequest(endpoint)
        return repository.fetchProducts(withEndpoint: endpoint)
    }

    func getProduct<T>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error> where T: Decodable {
        logRequest(endpoint)
        return repository.getProduct(withEndpoint: endpoint)
    }

    func addNewProduct<T>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error> where T: Decodable {
        logRequest(endpoint)
        return repository.addNewProduct(withEndpoint: endpoint)
    }

    func updateProduct<T>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error> where T: Decodable {
        logRequest(endpoint)
        return repository.updateProduct(withEndpoint: endpoint)
    }

    func deleteProduct<T>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error> where T: Decodable {
        logRequest(endpoint)
        return repository.deleteProduct(withEndpoint: endpoint)
    }

    private func logRequest<T>(_ endpoint: BaseAPIRequest<T>) {
        print("Logging remote request: \(endpoint)")
    }
}
*/
