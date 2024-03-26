import Foundation
import Combine
import UtilityLibrary

class PostRepository: BaseRepository<[Post]> {
    private let apiRequestProvider: APIRequestProviderProtocol
    
    init(apiRequestProvider: APIRequestProviderProtocol) {
        self.apiRequestProvider = apiRequestProvider
    }
    
    override func fetchData() -> AnyPublisher<[Post], Error> {
        let request = BaseAPIRequest<[Post]>(baseURL: URL(string: "https://jsonplaceholder.typicode.com")!, path: "/posts", method: "GET")
        return apiRequestProvider.makeRequest(request: request)
    }
}
