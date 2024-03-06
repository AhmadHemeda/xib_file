//
//  CustomButtonView.swift
//  XIBCustomView
//
//  Created by Ahmad Hemeda on 05/03/2024.
//

import UIKit

class CustomButtonView: UIView {
    //    static let identifier = "CustomButtonView"
    
    @IBOutlet var registerButtonView: UIView!
    @IBOutlet weak var registerButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    func initSubviews() {
        
        Bundle.main.loadNibNamed("CustomButtonView", owner: self, options: nil)
        
        registerButtonView.frame = self.bounds
        registerButtonView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        addSubview(registerButtonView)
        
        //        let nib = UINib(nibName: CustomButtonView.identifier, bundle: nil)
        //
        //        guard let view = nib.instantiate(withOwner: self, options: nil).first as?
        //                UIView else {fatalError("Unable to convert nib")}
        //
        //        view.frame = bounds
        //        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //
        //        addSubview(view)
        
    }
}
