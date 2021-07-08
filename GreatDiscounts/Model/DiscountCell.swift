//
//  DiscountCell.swift
//  GreatDiscounts
//
//  Created by Valerii D on 08.07.2021.
//

import UIKit

class DiscountCell: UITableViewCell {
    
    @IBOutlet var gameImage: UIImageView!
    @IBOutlet var gameNameLabel: UILabel!
    @IBOutlet var discountLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!

    
    func configure(with discount: Discount) {
        self.gameNameLabel.text = discount.title
        self.discountLabel.text = (discount.salePrice ?? "no price") + " $"
        self.priceLabel.text = (discount.normalPrice ?? "no price") + " $"

        
        DispatchQueue.global().async {
            if let url = discount.thumb {
                guard let imageURL = URL(string: url) else { return }
                guard let imageData = try? Data(contentsOf: imageURL) else { return }
                DispatchQueue.main.async {
                    self.gameImage.image = UIImage(data: imageData)
                }
            } else {
                print("ERROR URL!!!")
            }
        }
    }
}
