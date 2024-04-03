//import Foundation
//import Combine
//import UtilityLibrary
//
//class ProductRemoteDataSource: ProductRemoteDataSourceProtocol {
//    
//    private let apiRequestProvider: APIRequestProviderProtocol = APIRequestProvider.shared
//    
//    func fetchData() -> AnyPublisher<ProductAPIResponse, Error> {
//        let request = APIEndpoints.getProducts()
//        return apiRequestProvider.makeRequest(request: request)
//    }
//    
//    func getProduct(withId id: Int) -> AnyPublisher<Product, Error> {
//        let request = APIEndpoints.getProduct(withId: id)
//        return apiRequestProvider.makeRequest(request: request)
//    }
//    
//    func addNewProduct(title: String) -> AnyPublisher<Product, Error> {
//        print("ProductRepoRemote: Making request for addNewProduct")
//        let request = APIEndpoints.addNewProduct(title: title)
//        return apiRequestProvider.makeRequest(request: request)
//    }
//    
//    func updateProduct(withId id: Int, title: String) -> AnyPublisher<Product, Error> {
//        let request = APIEndpoints.updateProduct(withId: id, title: title)
//        return apiRequestProvider.makeRequest(request: request)
//    }
//    
//    func deleteProduct(withId id: Int) -> AnyPublisher<Product, Error> {
//        let request = APIEndpoints.deleteProduct(withId: id)
//        return apiRequestProvider.makeRequest(request: request)
//    }
//}
