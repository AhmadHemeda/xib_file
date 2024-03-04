//
//  ViewController.swift
//  XIBCustomView
//
//  Created by Ahmad Hemeda on 04/03/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.distribution = .fillEqually
        
        let firstCustomView = CustomView()
        firstCustomView.label.text = "First CustomView's Label"
        firstCustomView.contentView.backgroundColor = .green
        stackView.addArrangedSubview(firstCustomView)

        let secondCustomView = CustomView()
        secondCustomView.label.text = "Second CustomView's Label"
        secondCustomView.contentView.backgroundColor = .blue
        stackView.addArrangedSubview(secondCustomView)

        let thirdCustomView = CustomView()
        thirdCustomView.label.text = "Third CustomView's Label"
        thirdCustomView.contentView.backgroundColor = .yellow
        stackView.addArrangedSubview(thirdCustomView)

    }
}

