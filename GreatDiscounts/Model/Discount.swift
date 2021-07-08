//
//  Discount.swift
//  GreatDiscounts
//
//  Created by Valerii D on 08.07.2021.
//

import Foundation

struct Discount: Decodable {
    let title: String?
    let salePrice: String?
    let normalPrice: String?
    let steamRatingText: String?
    let thumb: String?
    let savings: String?
}
