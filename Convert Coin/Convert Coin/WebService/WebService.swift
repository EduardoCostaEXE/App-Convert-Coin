//
//  WebService.swift
//  Convert Coin
//
//  Created by Cabral Costa, Eduardo on 28/05/24.
//

import Foundation

class WebService {
    
    let urlBase:String = "https://economia.awesomeapi.com.br"
    
    public func getCoins(pathParam:String, onCompletion: @escaping (ConversionViewModel?, String?) -> Void) {
        
        let api:String = self.urlBase+"/json/last/"+pathParam
        
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let data = data {
                if let apiResponse = try? JSONDecoder().decode(ConversionViewModel.self, from: data) {
                    onCompletion(apiResponse, nil)
                } else if let error = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                    onCompletion(nil, error.message)
                } else {
                    onCompletion(nil, "Parse Error")
                }
                
            } else if let error = error {
                print(error.localizedDescription)
                onCompletion(nil, nil)
            }
            
        }.resume()
    }
}
