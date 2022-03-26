//
//  DashBoardVC.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/18/21.
//

import UIKit
import CoreData

class DashBoardVC: UIViewController {
    
    
    // Instances / Objects
    let networking = Networking()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var timer: Timer!
    // Global Variabl
    var cryptoCurrencies = [Crypto]()
    var isFavorite = false
    var favoriteCurriencies = [Crypto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.title = "Currencies"
        navigationController?.navigationBar.prefersLargeTitles = true
        print("View didLoad Finished")
//        fetchMethod()
        view.addSubview(spinner)
        spinnerConstraint()
        spinner.startAnimating()
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear called ")
        fetchMethod()
        spinner.startAnimating()
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(refreshPrice), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        cryptoCurrencies = []
        timer.invalidate()
    }
    
    func fetchMethod() {
        networking.fetch_cryptos { [self] (completed) in
            
            print("Fetching Data")
            DispatchQueue.main.async {
                switch completed {
                case .success(let currency):
                    for cryptoCurrency in currency.data {
                        //                    print(cryptoCurrency["name"], "First Currency")
                        // rewite code / handle optional
                        let id = cryptoCurrency["id"]
                        let name = cryptoCurrency["name"]
                        let priceUsd = cryptoCurrency["priceUsd"]
                        let rank = cryptoCurrency["rank"]
                        let maxSupply = cryptoCurrency["maxSupply"]
                        let marketCapUsd = cryptoCurrency["marketCapUsd"]
                        let volumUsd24hr = cryptoCurrency["volumeUsd24Hr"]
                        self.cryptoCurrencies.append(Crypto(id: "randonNumber", name: name!!, priceUsd: priceUsd!!, rank: rank!!, maxSupply: ((maxSupply ?? "0") ?? "0"), marketCapUsd: marketCapUsd!!, volumeUsd24Hr: volumUsd24hr!!))
                    }
                    cryptoUITableView?.reloadData()
                    print("Name: \(currency.data[0]["name"]),Price: \(currency.data[0]["priceUsd"])")
                    self.spinner.stopAnimating()
                case .failure(let error):
                    print(error.localizedDescription)
                    print("Unable to bring data back to VC")
                }
            }
            
        }
    }
    
    func subviews() {
        print("Subviews added")
        //        view.addSubview(currencyTableView)
        //        cryptoUITableView.delegate = self
        //        cryptoUITableView.dataSource = self
        //        currencyTableViewConstrant()
    }
    
    
    // Create TableView
    
    @IBOutlet weak var cryptoUITableView: UITableView!
    
    let currencyTableView: UITableView = {
        let dashBoardTV = UITableView()
        dashBoardTV.translatesAutoresizingMaskIntoConstraints = false
        //        dashBoardTV.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        dashBoardTV.register(CurrencyCell.self, forCellReuseIdentifier: CurrencyCell.cellIdentifier)
        dashBoardTV.rowHeight = 120
        dashBoardTV.separatorStyle = .none
        dashBoardTV.allowsSelection = false
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
    
    @objc func refreshPrice() {
        cryptoCurrencies = []
        fetchMethod()
    }
    
    lazy var spinner : UIActivityIndicatorView = {
        let spinner =  UIActivityIndicatorView(frame: .zero)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.style = .large
        return spinner
    }()
    
    func spinnerConstraint() {
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    
    
    
    
}
