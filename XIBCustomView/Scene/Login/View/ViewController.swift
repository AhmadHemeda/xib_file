//
//  ViewController.swift
//  XIBCustomView
//
//  Created by Ahmad Hemeda on 04/03/2024.
//

import UIKit
import Combine
import UtilityLibrary

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var customLogoView: CustomLogoView!
    @IBOutlet weak var customButtonView: CustomButtonView!
    @IBOutlet weak var customView: CustomView!
    @IBOutlet weak var stackView: UIStackView!
    
    private let coreDataStorageManager = CoreDataStorageManager.shared
    private var cancellables = Set<AnyCancellable>()
    private var productVM = ProductVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        productVM.fetchProductsRemote { [weak self] error in
//            if let error = error {
//                print("Error fetching products: \(error)")
//            } else {
//                // If fetching products was successful, save them to Core Data
//                if let products = self?.productVM.productResponseRemote {
//                    // Convert products to JSON data (assuming you have Codable conformance)
//                    do {
//                        let jsonData = try JSONEncoder().encode(products)
//                        // Save the response to Core Data
//                        self?.coreDataStorageManager.saveProductsFromJSON(jsonData: jsonData)
//                    } catch {
//                        print("Error encoding products to JSON: \(error)")
//                    }
//                }
//            }
//        }
        
        productVM.fetchProductsLocal { [weak self] error in
            if let error = error {
                print("Error fetching products: \(error)")
            }
        }
        
        // Subscribe to productResponse publisher
        productVM.$productResponseLocal
            .sink { [weak self] productResponse in
                guard let productResponse = productResponse else {
                    // Handle nil response if needed
                    return
                }
                
                // Iterate over each product and print its ID
                for product in productResponse {
                    print("Product ID: \(product.id)")
                }
            }
            .store(in: &cancellables)
    }
}
