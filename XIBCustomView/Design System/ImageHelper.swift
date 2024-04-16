//
//  ImageHelper.swift
//  XIBCustomView
//
//  Created by Ahmad Hemeda on 05/03/2024.
//

import Foundation
import UIKit

enum ImageHelper: String {
    case cloudyLogo

    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
