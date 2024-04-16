import Foundation
import Combine

class ProductVM: FetchProductsUseCaseDelegate {

    @Published var productResponseRemote: ProductAPIResponse?
    @Published var productResponseLocal: [ProductEntity]?
    @Published var error: Error?

    private var cancellables = Set<AnyCancellable>()
    private let fetchProductUseCase = FetchProductsUseCase()

    init() {
        fetchProductUseCase.delegate = self
    }

    func productsFetchedRemotely(_ products: ProductAPIResponse) {
        productResponseRemote = products
    }

    func productsFetchedLocally(_ products: [ProductEntity]) {
        productResponseLocal = products
    }

    func fetchProductsFailed(withError error: Error) {
        self.error = error
    }

    func fetchProducts() {
        fetchProductUseCase.fetchProducts()
    }

    func fetchProductsLocally() {
        fetchProductUseCase.fetchProductsLocally()
    }
}
