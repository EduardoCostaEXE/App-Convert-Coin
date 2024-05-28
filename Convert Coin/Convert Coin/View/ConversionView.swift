//
//  ConversionView.swift
//  Convert Coin
//
//  Created by Cabral Costa, Eduardo on 28/05/24.
//

import UIKit

class ConversionView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Conversor de Moedas"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let valueToConvertLabel: UILabel = {
        let label = UILabel()
        label.text = "Valor para conversão:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let valueTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Informe um valor"
        textField.backgroundColor = .systemGray5
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let fromCurrencyLabel: UILabel = {
        let label = UILabel()
        label.text = "De:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fromCurrencyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Moeda de origem"
        textField.backgroundColor = .systemGray5
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let toCurrencyLabel: UILabel = {
        let label = UILabel()
        label.text = "Para:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let toCurrencyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Moeda de destino"
        textField.backgroundColor = .systemGray5
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let convertButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Converter", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let convertedValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Valor convertido:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0.00"
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Inicializador
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(valueToConvertLabel)
        addSubview(valueTextField)
        addSubview(fromCurrencyLabel)
        addSubview(fromCurrencyTextField)
        addSubview(toCurrencyLabel)
        addSubview(toCurrencyTextField)
        addSubview(convertButton)
        addSubview(convertedValueLabel)
        addSubview(resultLabel)
        
        let valueStack = UIStackView(arrangedSubviews: [valueToConvertLabel, valueTextField])
        valueStack.axis = .vertical
        valueStack.spacing = 5
        valueStack.translatesAutoresizingMaskIntoConstraints = false
        
        let fromStack = UIStackView(arrangedSubviews: [fromCurrencyLabel, fromCurrencyTextField])
        fromStack.axis = .vertical
        fromStack.spacing = 5
        fromStack.translatesAutoresizingMaskIntoConstraints = false
        
        let toStack = UIStackView(arrangedSubviews: [toCurrencyLabel, toCurrencyTextField])
        toStack.axis = .vertical
        toStack.spacing = 5
        toStack.translatesAutoresizingMaskIntoConstraints = false
        
        let currencyStack = UIStackView(arrangedSubviews: [fromStack, toStack])
        currencyStack.axis = .horizontal
        currencyStack.spacing = 10
        currencyStack.distribution = .fillEqually
        currencyStack.translatesAutoresizingMaskIntoConstraints = false
        
        let resultStack = UIStackView(arrangedSubviews: [convertedValueLabel, resultLabel])
        resultStack.axis = .vertical
        resultStack.spacing = 5
        resultStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(valueStack)
        addSubview(currencyStack)
        addSubview(resultStack)
        
        // Layout dos componentes
        setupConstraints(valueStack: valueStack, currencyStack: currencyStack, resultStack: resultStack)
    }
    
    private func setupConstraints(valueStack: UIStackView, currencyStack: UIStackView, resultStack: UIStackView) {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            valueStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            valueStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            valueStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            currencyStack.topAnchor.constraint(equalTo: valueStack.bottomAnchor, constant: 20),
            currencyStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            currencyStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            convertButton.topAnchor.constraint(equalTo: currencyStack.bottomAnchor, constant: 20),
            convertButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            convertButton.widthAnchor.constraint(equalToConstant: 150),
            convertButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            resultStack.topAnchor.constraint(equalTo: convertButton.bottomAnchor, constant: 20),
            resultStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            resultStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
