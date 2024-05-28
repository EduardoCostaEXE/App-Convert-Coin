//
//  ViewController.swift
//  Convert Coin
//
//  Created by Cabral Costa, Eduardo on 28/05/24.
//

import UIKit

class ConversionViewController: UIViewController {
    
    // Instância da View personalizada
    let conversionView = ConversionView()
    let viewModel = ConversionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
    }
    
    private func setupView() {
        // Adicionando a view personalizada ao view controller
        view.addSubview(conversionView)
        conversionView.translatesAutoresizingMaskIntoConstraints = false
        
        // Definindo as constraints para a view personalizada
        NSLayoutConstraint.activate([
            conversionView.topAnchor.constraint(equalTo: view.topAnchor),
            conversionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            conversionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            conversionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
