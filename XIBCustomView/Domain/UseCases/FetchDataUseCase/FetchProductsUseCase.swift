import Foundation
import Combine

class FetchProductsUseCase {
    private let productRepository: ProductRepositoryProtocol = ProductRepository()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var productRemoteResponse: ProductAPIResponse?
    @Published var productResponseLocal: [ProductEntity]?
    @Published var error: Error?
    
    func fetchProducts() {
        let endPoint = APIEndpoint.getProducts()
        
        productRepository.fetchProducts(withEndpoint: endPoint)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error
                }
            } receiveValue: { productResponse in
                self.productRemoteResponse = productResponse
                self.productRepository.saveProductsFromJSON(with: productResponse)
            }
            .store(in: &cancellables)
    }
    
    func fetchProductsLocally() {
        productRepository.fetchProductsLocally()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error
                }
            } receiveValue: { productEntities in
                self.productResponseLocal = productEntities
            }
            .store(in: &cancellables)
    }

}
