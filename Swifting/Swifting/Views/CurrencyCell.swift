//
//  CurrencyCell.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/19/21.
//

import UIKit

class CurrencyCell: UITableViewCell {
    static var cellIdentifier: String = "currencyCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        set_up_subviews()
        // Configure the view for the selected state
        contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    
    func set_up_subviews() {
        contentView.addSubview(rank)
        contentView.addSubview(currency_name)
        contentView.addSubview(name_label)
        contentView.addSubview(price)
        contentView.addSubview(price_label)
        contentView.addSubview(favorite_button)
        NSLayoutConstraint.activate([
            // rank label constrant
            rank.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            rank.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            // Currency name
            currency_name.leadingAnchor.constraint(equalTo: rank.trailingAnchor, constant: 40),
            currency_name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            // Currency name label
            name_label.topAnchor.constraint(equalTo: currency_name.bottomAnchor, constant: 7),
            name_label.centerXAnchor.constraint(equalTo: currency_name.centerXAnchor, constant: 0),
            // Price
            price.leadingAnchor.constraint(equalTo: currency_name.trailingAnchor, constant: 50),
            price.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            // Price Label
            price_label.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 7),
            price_label.centerXAnchor.constraint(equalTo: price.centerXAnchor, constant: 0),
            // Fav button
            favorite_button.leadingAnchor.constraint(equalTo: price.trailingAnchor, constant: 40),
            favorite_button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0)
        ])
    }
    
    func updateCellUI(with currency: Crypto) {
        print("Cell UI UPDATED")
        
    }
    
    // UI
    let rank: UILabel = {
        let rank = UILabel()
        rank.text = "1"
        rank.translatesAutoresizingMaskIntoConstraints = false
        rank.font = UIFont(name: "Arial", size: 25)
        rank.font = UIFont.boldSystemFont(ofSize: 25)
        rank.adjustsFontForContentSizeCategory = true
        rank.numberOfLines =  100
        rank.textAlignment = .center
        rank.adjustsFontSizeToFitWidth = true
        rank.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //        rank.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return rank
    }()
    
    
    let currency_name: UILabel = {
        let currency_name = UILabel()
        currency_name.text = "Crypton"
        currency_name.translatesAutoresizingMaskIntoConstraints = false
        currency_name.font = UIFont(name: "Arial", size: 25)
        currency_name.font = UIFont.boldSystemFont(ofSize: 25)
        currency_name.adjustsFontForContentSizeCategory = true
        currency_name.numberOfLines =  100
        currency_name.textAlignment = .left
        currency_name.adjustsFontSizeToFitWidth = true
        currency_name.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //        currency_name.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return currency_name
    }()
    
    let name_label: UILabel = {
        let name_label = UILabel()
        name_label.text = "name"
        name_label.translatesAutoresizingMaskIntoConstraints = false
        name_label.font = UIFont(name: "Arial", size: 13)
        name_label.font = UIFont.boldSystemFont(ofSize: 13)
        name_label.adjustsFontForContentSizeCategory = true
        name_label.numberOfLines =  100
        name_label.textAlignment = .center
        name_label.adjustsFontSizeToFitWidth = true
        name_label.textColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        return name_label
    }()
    let price: UILabel = {
        let price = UILabel()
        price.text = "54,000"
        price.translatesAutoresizingMaskIntoConstraints = false
        price.font = UIFont(name: "Arial", size: 24)
        price.font = UIFont.boldSystemFont(ofSize: 24)
        price.adjustsFontForContentSizeCategory = true
        price.numberOfLines =  100
        price.textAlignment = .center
        price.adjustsFontSizeToFitWidth = true
        price.textColor = #colorLiteral(red: 0, green: 0.7711079121, blue: 0, alpha: 1)
        return price
    }()
    let price_label: UILabel = {
        let price_label = UILabel()
        price_label.text = "price"
        price_label.translatesAutoresizingMaskIntoConstraints = false
        price_label.font = UIFont(name: "Arial", size: 13)
        price_label.font = UIFont.boldSystemFont(ofSize: 13)
        price_label.adjustsFontForContentSizeCategory = true
        price_label.numberOfLines =  100
        price_label.textAlignment = .center
        price_label.adjustsFontSizeToFitWidth = true
        price_label.textColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        return price_label
    }()
    let favorite_button: UIButton = {
        let favorite_button = UIButton()
//        favorite_button.setTitle("⭐️", for: .normal)
        favorite_button.setImage(UIImage(named: "favorite.png"), for: .normal)
        favorite_button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        favorite_button.titleLabel?.font = UIFont(name: "Arial", size: 25)
        favorite_button.translatesAutoresizingMaskIntoConstraints = false
        return favorite_button
    }()
    
    
    
    
    
    
}
