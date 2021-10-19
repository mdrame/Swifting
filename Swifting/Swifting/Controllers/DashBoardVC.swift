//
//  DashBoardVC.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/18/21.
//

import UIKit

class DashBoardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        title = "Currencies"
        navigationController?.navigationBar.prefersLargeTitles = true
        //
        subviews()
        
        
    }
    
    func subviews() {
        view.addSubview(currencyTableView)
        currencyTableViewConstrant()
        currencyTableView.delegate = self
        currencyTableView.dataSource = self
    }
    
    
    // Create TableView
    
    let currencyTableView: UITableView = {
        let dashBoardTV = UITableView()
        dashBoardTV.translatesAutoresizingMaskIntoConstraints = false
        dashBoardTV.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        dashBoardTV.register(CurrencyCell.self, forCellReuseIdentifier: CurrencyCell.cellIdentifier)
        dashBoardTV.rowHeight = 100
        dashBoardTV.separatorStyle = .none
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
