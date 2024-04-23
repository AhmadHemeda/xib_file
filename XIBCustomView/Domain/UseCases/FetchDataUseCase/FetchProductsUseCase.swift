import Foundation
import Combine

class FetchProductsUseCase: FetchProductsUseCaseProtocol {

    private let repository: ProductRepositoryProtocol = DependencyContainer.shared.resolve()
    private var cancellables = Set<AnyCancellable>()

    var productsRemoteResponse: (
        (
            ProductAPIResponse?
        ) -> Void
    )?
    var productsLocalResponse: (
        (
            [ProductEntity]?
        ) -> Void
    )?
    var error: (
        (
            Error?
        ) -> Void
    )?

    func fetchProducts() {
        let endPoint = APIEndpoint.getProducts()

        repository.fetchProducts(
            withEndpoint: endPoint
        )
        .sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(
                let error
            ):
                self.error?(
                    error
                )
            }
        } receiveValue: { productResponse in
            self.productsRemoteResponse?(
                productResponse
            )
            //                self.repository.saveProductsFromJSON(with: productResponse)
        }
        .store(
            in: &cancellables
        )
    }

    func fetchProductsLocally() {

        repository.fetchProductsLocally()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(
                    let error
                ):
                    self.error?(
                        error
                    )
                }
            } receiveValue: { productEntities in
                self.productsLocalResponse?(
                    productEntities
                )
            }
            .store(
                in: &cancellables
            )
    }

}
