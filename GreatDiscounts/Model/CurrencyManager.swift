//
//  Currency.swift
//  GreatDiscounts
//
//  Created by Valerii D on 10.07.2021.
//

import Foundation
import Alamofire

protocol DetailViewControllerDelegate {
    func didUpdateVC(currency: [String : Double], currencyName: String)
}

class CurrencyManager {
    let key = "03e684870628d0fe02d70faa"
    var delegate: DetailViewControllerDelegate?
    
    func getCurrency(currencyName: String) {
        guard let url = URL(string: "https://v6.exchangerate-api.com/v6/\(key)/latest/USD") else { return }
        
        AF.request(url).validate().responseJSON { dataResonse in
            switch dataResonse.result {
            case .success(let value):
                
                guard let jsonData = value as? [String : Any] else { return }
                
                if let dictionary = jsonData["conversion_rates"] as? [String: Double] {
                    self.delegate?.didUpdateVC(currency: dictionary, currencyName: currencyName)
                }

                
            case .failure(let error):
                print(error)
            }
        }
    }
}
