import Foundation
import Combine

class PostsViewModel {
    @Published var posts: [Post] = []
    private let fetchPostsUseCase: FetchPostsUseCase
    
    init(fetchPostsUseCase: FetchPostsUseCase) {
        self.fetchPostsUseCase = fetchPostsUseCase
    }
    
    func fetchPosts(completion: @escaping (Error?) -> Void) {
        fetchPostsUseCase.execute(requestData: ())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion($0 as? Error) }) { [weak self] posts in
                self?.posts = posts
            }
            .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()
}
