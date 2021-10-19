//
//  CurrencyTableView.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/19/21.
//

import Foundation
import  UIKit

extension DashBoardVC: UITableViewDelegate, UITableViewDataSource {
    
    // Tableview delegate and Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.cellIdentifier, for: indexPath) as! CurrencyCell
        cell.textLabel?.text = "Test"
        cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // perform segue to Detail view
        navigationController?.pushViewController(CurrencyDetailView(), animated: false)
        
    }
    
    
    
}
