import Foundation
import Combine

class DummyAuthViewModel {
    @Published var loginResponse: LoginResponse?
    private let fetchDummyAuthUseCase: FetchDummyAuthUseCase = FetchDummyAuthUseCase()
    
    func fetchLoginResponse(
        completion: @escaping (Error?) -> Void
    ) {
        fetchDummyAuthUseCase.execute(
            requestData: ())
        .receive(
            on: DispatchQueue.main
        )
        .sink(
            receiveCompletion: {
                completion($0 as? Error)
            }
        ) { [weak self] loginResponse in
            self?.loginResponse = loginResponse
        }
        .store(
            in: &cancellables
        )
    }
    
    private var cancellables = Set<AnyCancellable>()
}
