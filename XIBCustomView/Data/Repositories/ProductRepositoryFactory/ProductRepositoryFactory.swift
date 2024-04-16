import Foundation

class ProductRepositoryFactory: ProductRepositoryFactoryProtocol {
    func makeRemoteRepository() -> RemoteProductRepositoryProtocol {
        return RemoteProductRepository()
    }
    
    func makeLocalRepository() -> LocalProductRepositoryProtocol {
        return LocalProductRepository()
    }
}
