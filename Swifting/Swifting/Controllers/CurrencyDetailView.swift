//
//  CurrencyDetailView.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/19/21.
//

import UIKit

class CurrencyDetailView: UIViewController {
    
    public var crypto = [Crypto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        configViews()
        updateDetailView(object: crypto)
    }
    
    
    func configViews() {
        view.addSubview(price)
        view.addSubview(price_label)
        view.addSubview(maxSupply)
        view.addSubview(maxSup_label)
        view.addSubview(marketCapUsd)
        view.addSubview(marCap_label)
        NSLayoutConstraint.activate([
            // Price label
            price.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            price.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            price.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            // Price label
            price_label.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 5),
            price_label.centerXAnchor.constraint(equalTo: price.centerXAnchor),
            // maxsupply
            maxSupply.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            maxSupply.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 80),
            maxSupply.widthAnchor.constraint(equalToConstant: view.frame.size.width - 50),
            // Maxsup label
            maxSup_label.topAnchor.constraint(equalTo: maxSupply.bottomAnchor, constant: 5),
            maxSup_label.centerXAnchor.constraint(equalTo: maxSupply.centerXAnchor),
            // Marketcap
            marketCapUsd.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            marketCapUsd.topAnchor.constraint(equalTo: maxSupply.bottomAnchor, constant: 50),
            marketCapUsd.widthAnchor.constraint(equalToConstant: view.frame.size.width - 50),
            // market cap label
            marCap_label.topAnchor.constraint(equalTo: marketCapUsd.bottomAnchor, constant: 5),
            marCap_label.centerXAnchor.constraint(equalTo: marketCapUsd.centerXAnchor)
        ])
    }
    
    private func updateDetailView(object: [Crypto]) {
        
        for currency in object {
            title = currency.name
            let convertedPrice = Float(currency.priceUsd)
            let formatedPrice = String(format: "$%.2f", convertedPrice as! CVarArg)
            price.text = "\(formatedPrice)"
            let formatter = NumberFormatter()
            formatter.numberStyle = NumberFormatter.Style.spellOut
            let convertedMaxSup = Float(currency.maxSupply)! as NSNumber
            let maxSupFormatter = NumberFormatter()
            maxSupFormatter.numberStyle = .spellOut
            let maxSupWord = maxSupFormatter.string(from: convertedMaxSup)
//            let formatedMaxSup = String(format: "$%.2f", convertedMaxSup as! CVarArg)
            maxSupply.text = "\(maxSupWord!)"
            let convertedMarCap = Float(currency.marketCapUsd)! as NSNumber
            let marCapFormatter = NumberFormatter()
            marCapFormatter.numberStyle = .spellOut
            let marCapWord = marCapFormatter.string(from: convertedMaxSup)
//            let formatedMarCap = String(format: "$%.2f", convertedMarCap as! CVarArg)
            marketCapUsd.text = "\(marCapWord!)"
        }
    }
    
    let price: UILabel = {
        let price = UILabel()
        price.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
//        price.text = "$47,38.433"
        price.font = UIFont(name: "Arial", size: 47)
        price.font = UIFont.boldSystemFont(ofSize: 47)
        price.textAlignment = .center
        //        price.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    let price_label: UILabel = {
        let price_label = UILabel()
        price_label.text = "price"
        price_label.translatesAutoresizingMaskIntoConstraints = false
        price_label.font = UIFont(name: "Arial", size: 13)
        price_label.font = UIFont.boldSystemFont(ofSize: 13)
        price_label.adjustsFontForContentSizeCategory = true
        price_label.textAlignment = .center
        price_label.adjustsFontSizeToFitWidth = true
        price_label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return price_label
    }()
    let maxSupply: UILabel = {
        let maxSupply = UILabel()
        maxSupply.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        maxSupply.text = "$60,0000"
        maxSupply.font = UIFont(name: "Arial", size: 25)
        maxSupply.font = UIFont.boldSystemFont(ofSize: 25)
        maxSupply.textAlignment = .center
//        maxSupply.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        maxSupply.layer.cornerRadius = 3
//        maxSupply.layer.borderWidth = 5
//        maxSupply.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        maxSupply.clipsToBounds = true
        maxSupply.adjustsFontSizeToFitWidth = true
        maxSupply.numberOfLines = 5
        maxSupply.translatesAutoresizingMaskIntoConstraints = false
        return maxSupply
    }()
    let maxSup_label: UILabel = {
        let maxSup_label = UILabel()
        maxSup_label.text = "max supply"
        maxSup_label.translatesAutoresizingMaskIntoConstraints = false
        maxSup_label.font = UIFont(name: "Arial", size: 13)
        maxSup_label.font = UIFont.boldSystemFont(ofSize: 13)
        maxSup_label.adjustsFontForContentSizeCategory = true
        maxSup_label.textAlignment = .center
        maxSup_label.adjustsFontSizeToFitWidth = true
        maxSup_label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return maxSup_label
    }()
    let marketCapUsd: UILabel = {
        let marketCapUsd = UILabel()
        marketCapUsd.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        marketCapUsd.text = "$2 Billion"
        marketCapUsd.font = UIFont(name: "Arial", size: 25)
        marketCapUsd.font = UIFont.boldSystemFont(ofSize: 25)
        marketCapUsd.textAlignment = .center
//        marketCapUsd.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        marketCapUsd.layer.cornerRadius = 3
//        marketCapUsd.layer.borderWidth = 5
//        marketCapUsd.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        marketCapUsd.clipsToBounds = true
        marketCapUsd.numberOfLines = 5
        marketCapUsd.adjustsFontSizeToFitWidth = true
        marketCapUsd.translatesAutoresizingMaskIntoConstraints = false
        return marketCapUsd
    }()
    let marCap_label: UILabel = {
        let marCap_label = UILabel()
        marCap_label.text = "market cap"
        marCap_label.translatesAutoresizingMaskIntoConstraints = false
        marCap_label.font = UIFont(name: "Arial", size: 13)
        marCap_label.font = UIFont.boldSystemFont(ofSize: 13)
        marCap_label.adjustsFontForContentSizeCategory = true
        marCap_label.textAlignment = .center
        marCap_label.adjustsFontSizeToFitWidth = true
        marCap_label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return marCap_label
    }()
    
    
    
    
}
