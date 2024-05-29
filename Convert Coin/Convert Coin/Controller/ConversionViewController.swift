//
//  ViewController.swift
//  Convert Coin
//
//  Created by Cabral Costa, Eduardo on 28/05/24.
//

import UIKit

class ConversionViewController: UIViewController {
    
    let conversionView = ConversionView()
    let viewModel: ConversionViewModel
    
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
    
    func actGetCoin(_ sender: UIButton) {
        let error:String = self.validateFields()
        if error != String.empty() {
            self.view.showMessageView(view: self, message: error)
        } else {
            let param1 = conversionView.toCurrencyTextField.text!
            let param2 = conversionView.fromCurrencyTextField.text!
            
            let param:String = "\(param1)-\(param2)"
            self.getCoins(param: param)
        }
    }

    private func validateFields() -> String {
        var error:String = String.empty()
        
        if conversionView.valueTextField.text == String.empty() {
            error = "Informe um valor a ser convertido"
        } else if conversionView.toCurrencyTextField.text == String.empty() || conversionView.fromCurrencyTextField.text == String.empty() {
            error = "Informe as moedas a serem convertidas"
        } else if conversionView.toCurrencyTextField.text == conversionView.fromCurrencyTextField.text {
            error = "Escolha moedas diferentes"
        }
        
        return error
    }
    
    private func getCoins(param:String) {
        self.viewModel.getCoins(params: param){ (data, error) in
            if let coins = data {
                DispatchQueue.main.async {
                    self.coinUsed = coins.first!.value
                    let valueStr:NSNumber = self.viewModel.calculateCoins(valueInfo: self.txtValueInfo.text!, valueCoin: self.coinUsed!.buyValue)
                    self.lblValueConvert.text = String().formatCurrency(value: valueStr, enumCoin: self.dropDownFrom.text!)
                }
            } else {
                
            }
        }
    }
}
