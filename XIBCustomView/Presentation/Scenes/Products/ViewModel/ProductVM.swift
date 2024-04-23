import Foundation
import Combine

class ProductVM {

    @Published var productResponseRemote: ProductAPIResponse?
    @Published var productResponseLocal: [ProductEntity]?
    @Published var error: Error?

    private var cancellables = Set<AnyCancellable>()
    private var fetchProductUseCase: FetchProductsUseCaseProtocol = DependencyContainer.shared.resolve()

    init() {
        setupSubscriptions()
    }

    private func setupSubscriptions() {
        fetchProductUseCase.productsRemoteResponse = { [weak self] response in
            self?.productResponseRemote = response
        }

        fetchProductUseCase.productsLocalResponse = { [weak self] response in
            self?.productResponseLocal = response
        }

        fetchProductUseCase.error = { [weak self] error in
            self?.error = error
        }
    }

    func fetchProducts() {
        fetchProductUseCase.fetchProducts()
    }

    func fetchProductsLocally() {
        fetchProductUseCase.fetchProductsLocally()
    }
}
