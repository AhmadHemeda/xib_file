import Foundation
import Combine

class ProductVM {
    
    @Published var productResponseRemote: ProductAPIResponse?
    @Published var productResponseLocal: [ProductEntity]?
    @Published var product: Product?
    @Published var error: Error?
    
    private var cancellables = Set<AnyCancellable>()
    private let fetchProductUseCase = FetchProductsUseCase()
    
    init() {
        setupSubscriptions()
    }
    
    private func setupSubscriptions() {
        fetchProductUseCase.$productRemoteResponse
            .assign(to: \.productResponseRemote, on: self)
            .store(in: &cancellables)
        
        fetchProductUseCase.$error
            .assign(to: \.error, on: self)
            .store(in: &cancellables)
        
        fetchProductUseCase.$productResponseLocal
            .assign(to: \.productResponseLocal, on: self)
            .store(in: &cancellables)
    }
    
    func fetchProducts() {
//        fetchProductUseCase.fetchProducts()
        fetchProductUseCase.fetchProductsLocally()
    }
}
