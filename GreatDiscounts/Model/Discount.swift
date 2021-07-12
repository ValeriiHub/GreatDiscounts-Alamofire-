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
    
    init(dictDiscount: [String : Any]) {
        title = dictDiscount["title"] as? String
        salePrice = dictDiscount["salePrice"] as? String
        normalPrice = dictDiscount["normalPrice"] as? String
        steamRatingText = dictDiscount["steamRatingText"] as? String
        thumb = dictDiscount["thumb"] as? String
        savings = dictDiscount["savings"] as? String
    }
}

