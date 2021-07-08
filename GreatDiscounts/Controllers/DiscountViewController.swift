//
//  DiscountViewController.swift
//  GreatDiscounts
//
//  Created by Valerii D on 07.07.2021.
//

import UIKit

class DiscountViewController: UITableViewController {

    var discounts = [Discount]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discounts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "discountCell", for: indexPath) as! DiscountCell

        let discount = discounts[indexPath.row]
        cell.configure(with: discount)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    func fetchData() {
        
        guard let url = URL(string: "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15&pageSize=100") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                
                do {
                    self.discounts = try JSONDecoder().decode([Discount].self, from: data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()                
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! DetailViewController
            detailVC.discount = discounts[indexPath.row]
        }
    }
}
