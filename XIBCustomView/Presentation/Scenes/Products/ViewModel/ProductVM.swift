import Foundation
import Combine

class ProductVM: BaseViewModel {

    @Published var productResponseRemote: ProductAPIResponse?
    @Published var productResponseLocal: [ProductEntity]?

    private var fetchProductUseCase: FetchProductsUseCaseProtocol = DependencyContainer.shared.resolve()

    internal override func setupSubscriptions() {
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

    override func fetchProducts() {
        fetchProductUseCase.fetchProducts()
    }

    override func fetchProductsLocally() {
        fetchProductUseCase.fetchProductsLocally()
    }
}
