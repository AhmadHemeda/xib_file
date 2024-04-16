import Foundation

class ProductRepositoryFactory: ProductRepositoryFactoryProtocol {
    func makeRemoteRepository() -> RemoteProductRepositoryProtocol {
        let remoteRepository = RemoteProductRepository()
        return LoggingRemoteProductRepositoryDecorator(repository: remoteRepository)
    }

    func makeLocalRepository() -> LocalProductRepositoryProtocol {
        let localRepository = LocalProductRepository()
        return LoggingLocalProductRepositoryDecorator(repository: localRepository)
    }
}
