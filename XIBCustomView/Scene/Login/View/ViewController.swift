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
    private var cancellables = Set<AnyCancellable>()
    private var viewModel: DummyAuthViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupViewModel()
        fetchToken()
    }
    
    // MARK: - Data Fetching

    private func setupViewModel() {
        let repository = DummyAuthRepository(apiRequestProvider: APIRequestProvider())
        let useCase = FetchDummyAuthUseCase(repository: repository)
        viewModel = DummyAuthViewModel(fetchDummyAuthUseCase: useCase)
        
        // Subscribe to loginResponse changes
        viewModel.$loginResponse
            .sink { [weak self] loginResponse in
                // Check if loginResponse is not nil
                if let loginResponse = loginResponse {
                    // Print all values of the response
                    print("ID: \(loginResponse.id ?? 0)")
                    print("Username: \(loginResponse.username ?? "")")
                    print("Email: \(loginResponse.email ?? "")")
                    print("First Name: \(loginResponse.firstName ?? "")")
                    print("Last Name: \(loginResponse.lastName ?? "")")
                    print("Gender: \(loginResponse.gender ?? "")")
                    print("Image URL: \(loginResponse.image ?? "")")
                    print("Token: \(loginResponse.token ?? "")")
                } else {
                    print("Login response is nil or empty.")
                }
            }
            .store(in: &cancellables)
    }
    
    private func fetchToken() {
        viewModel.fetchLoginResponse { error in
            if let error = error {
                print("Error fetching token: \(error)")
            }
        }
    }
    
    // MARK: - UI Configuration
    
    private func configureUI() {
        configureStackView()
        configureBackground()
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureBackground() {
        view.backgroundColor = PaletteHelper.darkSlateBlue.color
    }
}
