//
//  CustomLogoView.swift
//  XIBCustomView
//
//  Created by Ahmad Hemeda on 05/03/2024.
//

import UIKit

class CustomLogoView: UIView {
//    static let identifier = "CustomLogoView"
    
    @IBOutlet var logoView: UIView!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    func initSubviews() {
        
        Bundle.main.loadNibNamed("CustomlogoView", owner: self, options: nil)
        
        logoView.frame = self.bounds
        logoView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        addSubview(logoView)
        
        //        let nib = UINib(nibName: CustomLogoView.identifier, bundle: nil)
        //
        //        guard let view = nib.instantiate(withOwner: self, options: nil).first as?
        //                UIView else {fatalError("Unable to convert nib")}
        //
        //        view.frame = bounds
        //        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //
        //        addSubview(view)
        
    }
    
    func configureImageAndText(image : UIImage, text : String) {
        logoLabel.text = text
        logoImageView.image = image
    }
}
