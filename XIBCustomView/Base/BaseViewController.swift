import UIKit
import Combine
import UtilityLibrary

class BaseViewController: UIViewController {

    // MARK: - Properties

    var cancellables = Set<AnyCancellable>()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    // MARK: - Setup

    func setupBindings() {
    }

    // MARK: - Handling Responses

    func handleProductResponse(
        _ productResponse: ProductAPIResponse?
    ) {
    }

    func handleProductResponseLocal(
        _ productResponse: [ProductEntity]?
    ) {
    }

    func handleError(
        _ error: Error?
    ) {
    }
}
