import Foundation
import Combine
import UtilityLibrary

class FetchPostsUseCase: BaseUseCase<Void, [Post]> {
    private let repository: PostRepository
    
    init(repository: PostRepository) {
        self.repository = repository
    }
    
    override func execute(requestData: Void) -> AnyPublisher<[Post], Error> {
        return repository.fetchData()
    }
}
