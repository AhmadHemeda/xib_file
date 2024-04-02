import UIKit
import Combine
import UtilityLibrary

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var customLogoView: CustomLogoView!
    @IBOutlet weak var customButtonView: CustomButtonView!
    @IBOutlet weak var customView: CustomView!
    @IBOutlet weak var stackView: UIStackView!
    
    private var cancellables = Set<AnyCancellable>()
    private var productVM = ProductVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchProducts()
        observeProductResponseLocalChanges()
//        observeProductChanges()
    }
    
    private func fetchProducts() {
        productVM.fetchProductsRemote { [weak self] error in
            if let error = error {
                print("Error fetching products: \(error)")
            } else {
                if let products = self?.productVM.productResponseRemote {
                    self?.productVM.saveProductsToCoreData(products: products)
                    
                    self?.productVM.fetchProductsLocal { error in
                        if let error = error {
                            print("Error fetching products: \(error)")
                        }
                    }
                }
            }
        }
    }
    
    private func observeProductResponseLocalChanges() {
        productVM.$productResponseLocal
            .sink { [weak self] productEntities in
                guard let productEntities = productEntities else {
                    return
                }
                
                for productEntity in productEntities {
                    print("Product ID: \(productEntity.id)")
                    print("Product Title: \(productEntity.title ?? "")")
                    // Print other product details...
                }
            }
            .store(in: &cancellables)
    }
    
    private func observeProductChanges() {
        productVM.$product
            .sink { [weak self] product in
                guard let product = product else {
                    return
                }
                
                print("Product ID: \(product.id)")
                print("Product Title: \(product.title)")
                // Print other product details...
            }
            .store(in: &cancellables)
    }
    
    private func getProduct(withId id: Int) {
        productVM.getProduct(withId: id)
    }
    
    private func addNewProduct(title: String) {
        productVM.addNewProduct(title: title)
    }
    
    private func updateProduct(withId id: Int, title: String) {
        productVM.updateProduct(withId: id, title: title)
    }
    
    private func deleteProduct(withId id: Int) {
        productVM.deleteProduct(withId: id)
    }
}
