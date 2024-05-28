//
//  ViewController.swift
//  Convert Coin
//
//  Created by Cabral Costa, Eduardo on 28/05/24.
//

import UIKit

class ConversionViewController: UIViewController {
    
    let conversionView = ConversionView()
    let viewModel = ConversionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
    }
    
    private func setupView() {
        view.addSubview(conversionView)
        conversionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            conversionView.topAnchor.constraint(equalTo: view.topAnchor),
            conversionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            conversionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            conversionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
