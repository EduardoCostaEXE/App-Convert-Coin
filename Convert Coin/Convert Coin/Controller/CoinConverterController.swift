//
//  CoinConverterController.swift
//  Convert Coin
//
//  Created by Cabral Costa, Eduardo on 28/05/24.
//

import UIKit

class CoinConverterViewController: UIViewController {
    
    let conversionView = CoinConverterView()
    let viewModel = CoinConverterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
        setupActions()
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
    
    private func setupActions() {
        conversionView.convertButton.addTarget(self, action: #selector(actGetCoin), for: .touchUpInside)
    }
    
    @objc func actGetCoin(_ sender: UIButton) {
        let error = validateFields()
        if !error.isEmpty {
            self.view.showMessageView(view: self, message: error)
        } else {
            let param1 = conversionView.toCurrencyTextField.text!
            let param2 = conversionView.fromCurrencyTextField.text!
            
            let param = "\(param1)-\(param2)"
            getCoins(param: param)
        }
    }

    private func validateFields() -> String {
        var error = String.empty()
        
        if conversionView.valueTextField.text == String.empty() {
            error = "Informe um valor a ser convertido"
        } else if conversionView.toCurrencyTextField.text == String.empty() || conversionView.fromCurrencyTextField.text == String.empty() {
            error = "Informe as moedas a serem convertidas"
        } else if conversionView.toCurrencyTextField.text == conversionView.fromCurrencyTextField.text {
            error = "Escolha moedas diferentes"
        } else if !EnumCoins.allCases.contains(where: { $0.rawValue == conversionView.toCurrencyTextField.text }) || !EnumCoins.allCases.contains(where: { $0.rawValue == conversionView.fromCurrencyTextField.text }) {
            error = "Informe moedas válidas (USD, EUR, BRL)"
        }
        
        return error
    }
    
    private func getCoins(param: String) {
        self.viewModel.getCoins(params: param) { (data, error) in
            if let coins = data {
                DispatchQueue.main.async {
                    if let coinUsed = coins.first?.value {
                        let valueStr = self.viewModel.calculateCoins(valueInfo: self.conversionView.valueTextField.text!, valueCoin: coinUsed.buyValue)
                        self.conversionView.resultLabel.text = String().formatCurrency(value: valueStr, enumCoin: self.conversionView.fromCurrencyTextField.text!)
                    }
                }
            } else {
                self.view.showMessageView(view: self, message: error ?? "Erro ao obter os dados")
            }
        }
    }
}
