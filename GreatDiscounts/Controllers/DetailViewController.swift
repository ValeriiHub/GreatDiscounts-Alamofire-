//
//  DetailViewController.swift
//  GreatDiscounts
//
//  Created by Valerii D on 08.07.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var gameImage: ImageView!
    @IBOutlet var gamesNameLabel: UILabel!
    @IBOutlet var discountLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var savingLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var convertedLabel: UILabel!
    
    let currency = CurrencyManager()
    
    var discount = Discount()
    
    
    override func viewDidLoad() {
        
        currency.delegate = self
        
        super.viewDidLoad()
        gameImage.fetchImage(with: discount.thumb)
        gamesNameLabel.text = discount.title
        discountLabel.text = (discount.salePrice ?? "0") + " $"
        priceLabel.text = (discount.normalPrice ?? "0") + " $"
        savingLabel.text = discount.savings! + " %"
        ratingLabel.text = discount.steamRatingText ?? "No rating"
        currency.getCurrency(currencyName: "UAH")
    }
    
    @IBAction func converteChanged(_ sender: UISegmentedControl) {
        let currencyName = sender.titleForSegment(at: sender.selectedSegmentIndex)
        currency.getCurrency(currencyName: currencyName!)
    
    }
}

extension DetailViewController: DetailViewControllerDelegate {
    
    func didUpdateVC(currency: Currency, currencyName: String) {
        DispatchQueue.main.async {
            let price = (currency.conversionRates?[currencyName] ?? 0) * Double(self.discount.salePrice ?? "0")!
            self.convertedLabel.text = String(format: "%.2f", price)
        }
    }
    
    
}
