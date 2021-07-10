//
//  Currency.swift
//  GreatDiscounts
//
//  Created by Valerii D on 10.07.2021.
//

import Foundation

protocol DetailViewControllerDelegate {
    func didUpdateVC(currency: Currency, currencyName: String)
}

class CurrencyManager {
    let key = "03e684870628d0fe02d70faa"
    var delegate: DetailViewControllerDelegate?
    
    func getCurrency(currencyName: String) {
        guard let url = URL(string: "https://v6.exchangerate-api.com/v6/\(key)/latest/USD") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let currency = try JSONDecoder().decode(Currency.self, from: data)
                    self.delegate?.didUpdateVC(currency: currency, currencyName: currencyName)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
