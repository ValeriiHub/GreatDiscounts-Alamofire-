//
//  DetailViewController.swift
//  GreatDiscounts
//
//  Created by Valerii D on 08.07.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var gameImage: UIImageView!
    @IBOutlet var gamesNameLabel: UILabel!
    @IBOutlet var discountLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var savingLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var convertedLabel: UILabel!
    
    var discount = Discount(title: nil, salePrice: nil, normalPrice: nil, steamRatingText: nil, thumb: nil, savings: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamesNameLabel.text = discount.title
        discountLabel.text = (discount.salePrice ?? "0") + " $"
        priceLabel.text = (discount.normalPrice ?? "0") + " $"
        savingLabel.text = discount.savings! + " %"
        ratingLabel.text = discount.steamRatingText ?? "No rating"
        fetchImage()
    }
    
    @IBAction func converteChanged(_ sender: UISegmentedControl) {
    }
    
    func fetchImage(){
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
