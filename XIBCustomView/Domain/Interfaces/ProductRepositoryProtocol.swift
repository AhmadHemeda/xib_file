import Foundation
import Combine
import UtilityLibrary

protocol ProductRepositoryProtocol: RemoteProductRepositoryProtocol, LocalProductRepositoryProtocol {
    func fetchProducts<T: Decodable>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error>
    func getProduct<T: Decodable>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error>
    func addNewProduct<T: Decodable>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error>
    func updateProduct<T: Decodable>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error>
    func deleteProduct<T: Decodable>(withEndpoint endpoint: BaseAPIRequest<T>) -> AnyPublisher<T, Error>

    func fetchProductsLocally() -> AnyPublisher<[ProductEntity], Error>
    func getProductLocally(with product: ProductAPIResponse) -> AnyPublisher<ProductEntity?, Error>
    func addNewProductLocally(with product: ProductAPIResponse) -> AnyPublisher<ProductEntity, Error>
    func updateProductLocally(with product: ProductAPIResponse) -> AnyPublisher<ProductEntity, Error>
    func deleteProductLocally(with product: ProductAPIResponse) -> AnyPublisher<ProductEntity, Error>

    func saveProductsFromJSON(with product: ProductAPIResponse)
}
