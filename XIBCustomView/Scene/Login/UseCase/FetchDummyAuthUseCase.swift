import Foundation
import Combine
import UtilityLibrary

class FetchDummyAuthUseCase: BaseUseCase<Void, LoginResponse> {
    private let repository: DummyAuthRepository
    
    init(repository: DummyAuthRepository) {
        self.repository = repository
    }
    
    override func execute(requestData: Void) -> AnyPublisher<LoginResponse, Error> {
        return repository.fetchData()
    }
}
