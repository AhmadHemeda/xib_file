import Foundation
import Combine
import UtilityLibrary

class DummyAuthRepository: BaseRepository<LoginResponse> {
    private let apiRequestProvider: APIRequestProviderProtocol
    
    init(apiRequestProvider: APIRequestProviderProtocol) {
        self.apiRequestProvider = apiRequestProvider
    }
    
    override func fetchData() -> AnyPublisher<LoginResponse, Error> {
        let request = BaseAPIRequest<LoginResponse>(baseURL: URL(string: "https://dummyjson.com")!,
                                             path: "/auth/login",
                                             method: "POST",
                                             headers: ["Content-Type": "application/json"],
                                             body: try? JSONEncoder().encode(DummyAuthRequest(username: "kminchelle", password: "0lelplR")))
        return apiRequestProvider.makeRequest(request: request)
    }
}
