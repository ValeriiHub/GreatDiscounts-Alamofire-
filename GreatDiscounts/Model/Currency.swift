//
//  Currency.swift
//  GreatDiscounts
//
//  Created by Valerii D on 10.07.2021.
//

import Foundation

struct Currency: Decodable {
    let conversionRates: [String: Double]?
    
    enum CodingKeys: String, CodingKey {
            case conversionRates = "conversion_rates"
        }
}
