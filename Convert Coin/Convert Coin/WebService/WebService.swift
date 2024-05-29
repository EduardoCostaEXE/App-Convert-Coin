//
//  WebService.swift
//  Convert Coin
//
//  Created by Cabral Costa, Eduardo on 28/05/24.
//

import Foundation

class WebService {
    
    private let urlBase = "https://economia.awesomeapi.com.br"
    
    public func getCoins(pathParam:String, onCompletion: @escaping (ExchangeCoins?, String?) -> Void) {
        
        let api = "\(urlBase)/json/last/\(pathParam)"
        
        guard let url = URL(string: api) else {
            onCompletion(nil, "Invalid URL")
            return
         }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                onCompletion(nil, error.localizedDescription)
                return
            }
            
            guard let data = data else {
                onCompletion(nil, "No data received")
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(ExchangeCoins.self, from: data)
                onCompletion(apiResponse, nil)
            } catch {
                do {
                    let apiError = try JSONDecoder().decode(ErrorResponse.self, from: data)
                    onCompletion(nil, apiError.message)
                } catch {
                    onCompletion(nil, "Parse error")
                }
            }
        }.resume()
    }
}
