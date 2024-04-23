import Foundation
import Combine
import UtilityLibrary

protocol RemoteProductRepositoryProtocol {
    func fetchProducts<T: Decodable>(
        withEndpoint endpoint: BaseAPIRequest<T>
    ) -> AnyPublisher<
        T,
        Error
    >

    func getProduct<T: Decodable>(
        withEndpoint endpoint: BaseAPIRequest<T>
    ) -> AnyPublisher<
        T,
        Error
    >

    func addNewProduct<T: Decodable>(
        withEndpoint endpoint: BaseAPIRequest<T>
    ) -> AnyPublisher<
        T,
        Error
    >

    func updateProduct<T: Decodable>(
        withEndpoint endpoint: BaseAPIRequest<T>
    ) -> AnyPublisher<
        T,
        Error
    >

    func deleteProduct<T: Decodable>(
        withEndpoint endpoint: BaseAPIRequest<T>
    ) -> AnyPublisher<
        T,
        Error
    >
}
