import Foundation
import Combine

class FetchProductsUseCase {
    weak var delegate: FetchProductsUseCaseDelegate?

    private let repositoryFactory: ProductRepositoryFactoryProtocol = ProductRepositoryFactory()
    private var cancellables = Set<AnyCancellable>()

    func fetchProducts() {
        let endPoint = APIEndpoint.getProducts()
        let repository = repositoryFactory.makeRemoteRepository()

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
        let repository = repositoryFactory.makeLocalRepository()

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
