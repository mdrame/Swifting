//
//  DashBoardVC.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/18/21.
//

import UIKit

class DashBoardVC: UIViewController{
    

    // Instances / Objects
    let networking = Networking()
    // Global Variabl
    var cryptoCurrencies = [Crypto]()
    var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        title = "Crypto Currencies"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        print("View didLoad")
        fetchMethod()
        subviews()
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchMethod()
        currencyTableView.reloadData()
    }
    
    func fetchMethod() {
        networking.fetch_cryptos { [self] (currency) in
            //            print("Data after completion handler: \(currency.data)")
            print("Fetching Data")
            DispatchQueue.main.async {
                for cryptoCurrency in currency.data {
//                    print(cryptoCurrency["name"], "First Currency")
                    // rewite code / handle optional
                    let id = "randonNumber"
                    let name = cryptoCurrency["name"]
                    let priceUsd = cryptoCurrency["priceUsd"]
                    let rank = cryptoCurrency["rank"]
                    let maxSupply = cryptoCurrency["maxSupply"]
                    let marketCapUsd = cryptoCurrency["marketCapUsd"]
                    let volumUsd24hr = cryptoCurrency["volumeUsd24Hr"]
                    self.cryptoCurrencies.append(Crypto(id: id, name: name!!, priceUsd: priceUsd!!, rank: rank!!, maxSupply: ((maxSupply ?? "0") ?? "0"), marketCapUsd: marketCapUsd!!, volumeUsd24Hr: volumUsd24hr!!))
                    print(cryptoCurrencies[0].name, "is in array")
                    
                }
            }
        }
    }
    
    func subviews() {
        print("Subviews added")
        view.addSubview(currencyTableView)
        self.currencyTableView.delegate = self
        self.currencyTableView.dataSource = self
        currencyTableViewConstrant()
    }
    
    
    // Create TableView
    
    let currencyTableView: UITableView = {
        let dashBoardTV = UITableView()
        dashBoardTV.translatesAutoresizingMaskIntoConstraints = false
        //        dashBoardTV.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        dashBoardTV.register(CurrencyCell.self, forCellReuseIdentifier: CurrencyCell.cellIdentifier)
        dashBoardTV.rowHeight = 120
                dashBoardTV.separatorStyle = .none
        //        dashBoardTV.isUserInteractionEnabled = true
        return dashBoardTV
    }()
    
    func currencyTableViewConstrant() {
        NSLayoutConstraint.activate([
            currencyTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            currencyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currencyTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            currencyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    

     
    
    
}
