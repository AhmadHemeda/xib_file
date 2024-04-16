//
//  CustomLogoView.swift
//  XIBCustomView
//
//  Created by Ahmad Hemeda on 05/03/2024.
//

import UIKit
import UtilityLibrary

class CustomLogoView: NibLoadingView {

    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!

    func configureImageAndText(image: UIImage, text: String) {
        logoLabel.text = text
        logoImage.image = image
    }
}
