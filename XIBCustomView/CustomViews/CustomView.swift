//
//  CustomView.swift
//  XIBCustomView
//
//  Created by Ahmad Hemeda on 04/03/2024.
//

import UIKit

class CustomView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
