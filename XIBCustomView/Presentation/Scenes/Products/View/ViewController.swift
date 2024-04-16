import UIKit
import Combine
import UtilityLibrary

class ViewController: UIViewController {

    // MARK: - Properties

    private var cancellables = Set<AnyCancellable>()
    private var productVM = ProductVM()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        fetchProductsFromRemote()
        fetchProductsFromLocal()
    }

    // MARK: - Setup

    private func setupBindings() {
        productVM.$productResponseRemote
            .sink { [weak self] productResponse in
                self?.handleProductResponse(productResponse)
            }
            .store(in: &cancellables)

        productVM.$error
            .sink { [weak self] error in
                self?.handleError(error)
            }
            .store(in: &cancellables)

        productVM.$productResponseLocal
            .sink { [weak self] productResponse in
                self?.handleProductResponseLocal(productResponse)
            }
            .store(in: &cancellables)
    }

    // MARK: - Fetch Products

    private func fetchProductsFromRemote() {
        productVM.fetchProducts()
    }

    private func fetchProductsFromLocal() {
        productVM.fetchProductsLocally()
    }

    // MARK: - Handling Responses

    private func handleProductResponse(_ productResponse: ProductAPIResponse?) {
        if let product = productResponse?.products {
            print("Remote products response:")
            print(product)
        } else {
            print("Product response is nil or empty")
        }
    }

    private func handleProductResponseLocal(_ productResponse: [ProductEntity]?) {
        if let productResponse = productResponse, !productResponse.isEmpty {
            print("Local products response:")
            for product in productResponse {
                print("Product title: \(product.title ?? "No title")")
                print("Product description: \(product.productDescription ?? "No description")")
            }
        } else {
            print("Local products response is empty")
        }
    }

    private func handleError(_ error: Error?) {
        if let error = error {
            print("Error: \(error)")
        } else {
            print("No error")
        }
    }
}
