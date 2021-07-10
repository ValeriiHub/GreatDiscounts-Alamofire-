//
//  Discount.swift
//  GreatDiscounts
//
//  Created by Valerii D on 08.07.2021.
//

import Foundation

struct Discount: Decodable {
    var title: String?
    var salePrice: String?
    var normalPrice: String?
    var steamRatingText: String?
    var thumb: String?
    var savings: String?
}

