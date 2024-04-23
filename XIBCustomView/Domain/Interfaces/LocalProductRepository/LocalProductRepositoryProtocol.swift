import Foundation
import Combine

protocol LocalProductRepositoryProtocol {
    func fetchProductsLocally() -> AnyPublisher<
        [ProductEntity],
        Error
    >

    func getProductLocally(
        with product: ProductAPIResponse
    ) -> AnyPublisher<
        ProductEntity?,
        Error
    >

    func addNewProductLocally(
        with product: ProductAPIResponse
    ) -> AnyPublisher<
        ProductEntity,
        Error
    >

    func updateProductLocally(
        with product: ProductAPIResponse
    ) -> AnyPublisher<
        ProductEntity,
        Error
    >

    func deleteProductLocally(
        with product: ProductAPIResponse
    ) -> AnyPublisher<
        ProductEntity,
        Error
    >

    func saveProductsFromJSON(
        with product: ProductAPIResponse
    )
}
