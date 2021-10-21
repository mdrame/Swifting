//
//  CurrencyTableView.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/19/21.
//

import Foundation
import  UIKit

extension DashBoardVC: UITableViewDelegate, UITableViewDataSource, CurrencyCellDelegate {
    
    
    
   @objc func favorite_button_tap(sender: UIButton) {
        isFavorite.toggle()
        switch isFavorite {
        case true:
            // is Favorite selected
            sender.setImage(UIImage(named: "yellowstar.png"), for: .normal)
            print("fav botton yellow color")
        case false:
            // is Favorite unselected
            sender.setImage(UIImage(named: "clearstar.png"), for: .normal)
            print("fav botton black color")
        default:
            sender.setImage(UIImage(named: "clearstar.png"), for: .normal)
            print("Favorite button in unknow state ")
        }
    }
    
    
    // Tableview delegate and Data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cryptoCurrencies.count
        return cryptoCurrencies.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.cellIdentifier, for: indexPath) as! CurrencyCell
        cell.updateCellUI(with: cryptoCurrencies[indexPath.row])
        cell.currencyCellDelegate = self
        cell.favorite_button.addTarget(self, action: #selector(favorite_button_tap(sender:)), for: .touchUpInside) // add button target in CellForRow method. ‼️
        print("Cell for row at method called")
//        cell.selectionStyle = .blue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // perform segue to Detail view
        print("Cell Selected")
        let index = cryptoCurrencies[indexPath.row]
        let detailVC = CurrencyDetailView()
        detailVC.crypto = [index]
        navigationController?.pushViewController(detailVC, animated: false)
        
    }
    
    
    
}
