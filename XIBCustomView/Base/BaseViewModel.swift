import Foundation
import Combine

class BaseViewModel {

    // MARK: - Properties

    @Published var error: Error?

    var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscriptions()
    }

    func setupSubscriptions() {
    }

    func fetchProducts() {
    }

    func fetchProductsLocally() {
    }
}
