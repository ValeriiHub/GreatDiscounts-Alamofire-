//
//  DiscountCell.swift
//  GreatDiscounts
//
//  Created by Valerii D on 08.07.2021.
//

import UIKit

class DiscountCell: UITableViewCell {
    
    @IBOutlet var gameImage: ImageView!
    @IBOutlet var gameNameLabel: UILabel!
    @IBOutlet var discountLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!

    
    func configure(with discount: Discount) {
        self.gameNameLabel.text = discount.title
        self.discountLabel.text = (discount.salePrice ?? "no price") + " $"
        self.priceLabel.text = (discount.normalPrice ?? "no price") + " $"
        
        gameImage.fetchImage(with: discount.thumb)
    }
}
