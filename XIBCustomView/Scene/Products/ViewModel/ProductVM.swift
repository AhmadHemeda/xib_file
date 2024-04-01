import Foundation
import Combine

class ProductVM {
    @Published var productResponseRemote: ProductAPIResponse?
    private let productUseCaseRemote: ProductUseCase = ProductUseCase()
    
    @Published var productResponseLocal: [ProductEntity]?
    private let productUseCaseLocal: ProductUseCaseLocal = ProductUseCaseLocal()
    
    func fetchProductsRemote(
        completion: @escaping (Error?) -> Void
    ) {
        productUseCaseRemote.execute(
            requestData: ())
        .receive(
            on: DispatchQueue.main
        )
        .sink(
            receiveCompletion: {
                completion($0 as? Error)
            }
        ) { [weak self] productResponseRemote in
            self?.productResponseRemote = productResponseRemote
        }
        .store(
            in: &cancellables
        )
    }
    
    func fetchProductsLocal(
        completion: @escaping (Error?) -> Void
    ) {
        productUseCaseLocal.execute(
            requestData: ())
        .receive(
            on: DispatchQueue.main
        )
        .sink(
            receiveCompletion: {
                completion($0 as? Error)
            }
        ) { [weak self] productResponseLocal in
            self?.productResponseLocal = productResponseLocal
        }
        .store(
            in: &cancellables
        )
    }

    private var cancellables = Set<AnyCancellable>()
}
