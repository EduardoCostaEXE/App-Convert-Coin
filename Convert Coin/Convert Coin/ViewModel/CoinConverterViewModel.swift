//
//  CoinConverterViewModel.swift
//  Convert Coin
//
//  Created by Cabral Costa, Eduardo on 28/05/24.
//

import Foundation

class CoinConverterViewModel {
            
    public func getCoins(params:String, onCompletion: @escaping (ExchangeCoins?, String?) -> Void) {
        WebService().getCoins(pathParam:params) { (data, error) in
            if let coins = data {
                onCompletion(coins, nil)
            } else {
                onCompletion(nil, error)
            }
        }
    }
    
    public func calculateCoins(valueInfo:String, valueCoin:String) -> NSNumber {
        let value:Float = Float(valueInfo)!
        let coin:Float = Float(valueCoin)!
        
        let calc:Float = coin * value
        
        return NSNumber(value: calc)
    }
}
