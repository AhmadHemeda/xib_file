import Foundation
import Combine

class FetchProductsUseCase: FetchProductsUseCaseProtocol {
    weak var delegate: FetchProductsUseCaseDelegate?

    private let repository: ProductRepositoryProtocol = DependencyContainer.shared.resolve()
    private var cancellables = Set<AnyCancellable>()

    func fetchProducts() {
        let endPoint = APIEndpoint.getProducts()

        repository.fetchProducts(withEndpoint: endPoint)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.delegate?.fetchProductsFailed(withError: error)
                }
            } receiveValue: { productResponse in
                self.delegate?.productsFetchedRemotely(productResponse)
//                self.productRepository.saveProductsFromJSON(with: productResponse)
            }
            .store(in: &cancellables)
    }

    func fetchProductsLocally() {

        repository.fetchProductsLocally()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.delegate?.fetchProductsFailed(withError: error)
                }
            } receiveValue: { productEntities in
                self.delegate?.productsFetchedLocally(productEntities)
            }
            .store(in: &cancellables)
    }

}
