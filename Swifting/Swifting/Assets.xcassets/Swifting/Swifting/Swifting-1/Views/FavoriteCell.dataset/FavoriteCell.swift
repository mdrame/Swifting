//
//  FavoriteCell.swift
//  Swifting
//
//  Created by Mohammed Drame on 11/2/21.
//

import UIKit

class FavoriteCell: UITableViewCell {
    static var cellIdentifier: String = "currencyCell"
    
    // Global variables & Instances
    var isFavorite: Bool = false
    var currencyCellDelegate : CurrencyCellDelegate?
    
    // UI
    @IBOutlet weak var ranki: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
 

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
//    
//    func updateCellUI(with currency: Crypto) {
////        print("Cell UI UPDATED ‼️")
//        currencyRank.text = currency.rank
//        name.text = currency.name
//        let convertedPrice = Float(currency.priceUsd)
//        let formatedPrice = String(format: "$%.2f", convertedPrice as! CVarArg)
//        price.text = formatedPrice
//        favorite_button.imageView?.image = currency.isFavorite ? UIImage(named: "yellowstar.png") : UIImage(named: "clearstar.png")
//    }

}
