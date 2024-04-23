import Foundation
import Combine
import UtilityLibrary

class ProductRepository: ProductRepositoryProtocol {

    private let remoteRepository: RemoteProductRepositoryProtocol = RemoteProductRepository()
    private let localRepository: LocalProductRepositoryProtocol = LocalProductRepository()

    // MARK: - RemoteProductRepositoryProtocol

    func fetchProducts<T: Decodable>(
        withEndpoint endpoint: BaseAPIRequest<T>
    ) -> AnyPublisher<
        T,
        Error
    > {
        remoteRepository.fetchProducts(
            withEndpoint: endpoint
        )
    }

    func getProduct<T: Decodable>(
        withEndpoint endpoint: BaseAPIRequest<T>
    ) -> AnyPublisher<
        T,
        Error
    > {
        remoteRepository.getProduct(
            withEndpoint: endpoint
        )
    }

    func addNewProduct<T: Decodable>(
        withEndpoint endpoint: BaseAPIRequest<T>
    ) -> AnyPublisher<
        T,
        Error
    > {
        remoteRepository.addNewProduct(
            withEndpoint: endpoint
        )
    }

    func updateProduct<T: Decodable>(
        withEndpoint endpoint: BaseAPIRequest<T>
    ) -> AnyPublisher<
        T,
        Error
    > {
        remoteRepository.updateProduct(
            withEndpoint: endpoint
        )
    }

    func deleteProduct<T: Decodable>(
        withEndpoint endpoint: BaseAPIRequest<T>
    ) -> AnyPublisher<
        T,
        Error
    > {
        remoteRepository.deleteProduct(
            withEndpoint: endpoint
        )
    }

    // MARK: - LocalProductRepositoryProtocol
    
    func fetchProductsLocally() -> AnyPublisher<
        [ProductEntity],
        Error
    > {
        localRepository.fetchProductsLocally()
    }

    func getProductLocally(
        with product: ProductAPIResponse
    ) -> AnyPublisher<
        ProductEntity?,
        Error
    > {
        localRepository.getProductLocally(
            with: product
        )
    }

    func addNewProductLocally(
        with product: ProductAPIResponse
    ) -> AnyPublisher<
        ProductEntity,
        Error
    > {
        localRepository.addNewProductLocally(
            with: product
        )
    }

    func updateProductLocally(
        with product: ProductAPIResponse
    ) -> AnyPublisher<
        ProductEntity,
        Error
    > {
        localRepository.updateProductLocally(
            with: product
        )
    }

    func deleteProductLocally(
        with product: ProductAPIResponse
    ) -> AnyPublisher<
        ProductEntity,
        Error
    > {
        localRepository.deleteProductLocally(
            with: product
        )
    }

    func saveProductsFromJSON(
        with product: ProductAPIResponse
    ) {
        localRepository.saveProductsFromJSON(
            with: product
        )
    }
}
