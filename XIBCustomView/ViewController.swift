//
//  ViewController.swift
//  XIBCustomView
//
//  Created by Ahmad Hemeda on 04/03/2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure stack view
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        // Set background color
        view.backgroundColor = PaletteHelper.darkSlateBlue.color
        
        // Add stack view to the view hierarchy
        view.addSubview(stackView)
        
        // Add custom logo view
        let customLogoView = CustomLogoView()
        customLogoView.logoLabel.font = UIFont.systemFont(ofSize: 30)
        customLogoView.logoLabel.textColor = PaletteHelper.whiteSmoke.color
        customLogoView.logoView.backgroundColor = PaletteHelper.darkSlateBlue.color
        customLogoView.configureImageAndText(image: ImageHelper.cloudyLogo.image, text: "CLOUDIFY")
        stackView.addArrangedSubview(customLogoView)
        
        // Add custom button view
        let customButtonView = CustomButtonView()
        customButtonView.registerButton.setTitle("LOG IN", for: .normal)
        customButtonView.registerButtonView.backgroundColor = PaletteHelper.darkSlateBlue.color
        customButtonView.registerButton.backgroundColor = PaletteHelper.turquoiseBlue.color
        customButtonView.registerButton.setTitleColor(PaletteHelper.whiteSmoke.color, for: .normal)
        
        // Configure button constraints
        let buttonHeightConstraint = customButtonView.registerButton.heightAnchor.constraint(equalToConstant: 50)
        buttonHeightConstraint.isActive = true
        customButtonView.registerButton.layer.cornerRadius = 5
        customButtonView.registerButton.translatesAutoresizingMaskIntoConstraints = false
        customButtonView.registerButton.leadingAnchor.constraint(equalTo: customButtonView.leadingAnchor, constant: 24).isActive = true
        customButtonView.registerButton.trailingAnchor.constraint(equalTo: customButtonView.trailingAnchor, constant: -24).isActive = true
        
        // Add "Forgot Password?" label
        let forgotPasswordLabel = UILabel()
        forgotPasswordLabel.text = "Forgot Password?"
        forgotPasswordLabel.textColor = PaletteHelper.whiteSmoke.color
        forgotPasswordLabel.textAlignment = .center
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        customButtonView.addSubview(forgotPasswordLabel)
        forgotPasswordLabel.leadingAnchor.constraint(equalTo: customButtonView.leadingAnchor).isActive = true
        forgotPasswordLabel.trailingAnchor.constraint(equalTo: customButtonView.trailingAnchor).isActive = true
        forgotPasswordLabel.topAnchor.constraint(equalTo: customButtonView.registerButton.bottomAnchor, constant: 8).isActive = true
        
        // Add custom button view to stack view
        stackView.addArrangedSubview(customButtonView)
        
        //        let secondCustomView = CustomView()
        //        secondCustomView.label.text = "Second CustomView's Label"
        //        secondCustomView.contentView.backgroundColor = PaletteHelper.paleLimeGreen.color
        //        stackView.addArrangedSubview(secondCustomView)
        //
        //        let thirdCustomView = CustomView()
        //        thirdCustomView.label.text = "Third CustomView's Label"
        //        thirdCustomView.contentView.backgroundColor = PaletteHelper.limeGreen.color
        //        stackView.addArrangedSubview(thirdCustomView)
        
    }
}

