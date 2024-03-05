//
//  ColorHelper.swift
//  XIBCustomView
//
//  Created by Ahmad Hemeda on 05/03/2024.
//

import UIKit

enum PaletteHelper: String {
    case pastelYellow = "pastelYellow"
    case paleLimeGreen = "paleLimeGreen"
    case limeGreen = "limeGreen"
    case forestGreen = "fourthColor"
    
    var color: UIColor {
        return UIColor(named: self.rawValue)!
    }
}

//import UIKit
//
//enum PaletteHelper {
//    case pastelYellow
//    case paleLimeGreen
//    case limeGreen
//    case forestGreen
//    
//    var color: UIColor {
//        switch self {
//        case .pastelYellow:
//            return UIColor(named: "pastelYellow")!
//        case .paleLimeGreen:
//            return UIColor(named: "paleLimeGreen")!
//        case .limeGreen:
//            return UIColor(named: "limeGreen")!
//        case .forestGreen:
//            return UIColor(named: "fourthColor")!
//        }
//    }
//    
//}

//import UIKit
//
//enum PaletteHelper {
//    case pastelYellow, paleLimeGreen, limeGreen, forestGreen
//    
//    var color: UIColor {
//        let colorNames: [PaletteHelper: String] = [.pastelYellow: "pastelYellow",
//                                                   .paleLimeGreen: "paleLimeGreen",
//                                                   .limeGreen: "limeGreen",
//                                                   .forestGreen: "forestGreen"]
//        return UIColor(named: colorNames[self] ?? "")!
//    }
//}
