//
//  CurrencyTableView.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/19/21.
//

import Foundation
import  UIKit

extension DashBoardVC: UITableViewDelegate, UITableViewDataSource {
    
//    @objc func favorite_button_tap(sender: UIButton, cell: UITableViewCell) {
//        let indexPath = cryptoUITableView.indexPath(for: cell)!
//        print("Cell index path: \(indexPath.row)")
//        let isFav = cryptoCurrencies[indexPath.row].isFavorite
//        cryptoCurrencies[indexPath.row].isFavorite = !isFav //  updating
//        let is_favorite = cryptoCurrencies[indexPath.row].isFavorite
//        print("Is Favorite: \(is_favorite)")
//        // Re-write cordata methods CRUD
//        switch is_favorite {
//        case true:
//            print("Save to core data")
//            var favoriteCurrency =  cryptoCurrencies[indexPath.row]
//            let newFavObject = Cryptoo(context: self.context)
//            newFavObject.name = favoriteCurrency.name
//            newFavObject.priceUsd = favoriteCurrency.priceUsd
//            newFavObject.isFavorite = favoriteCurrency.isFavorite
//            do {
//               try self.context.save()
//            } catch {
//                print("Error while saving favorite crypto")
//            }
//        case false:
//            print("Delete from core data")
//            do {
//                //
//                let fetchedFavoriteCurrency = try context.fetch(Cryptoo.fetchRequest())
//                print(fetchedFavoriteCurrency[indexPath.row].name)
//            } catch {
//                print("Error fetching data for core data ")
//            }
//        default:
//            print("Unkknow state, on presisting data")
//        }
//
//        // save & unsave this to DB base on button state
////        cryptoUITableView.reloadRows(at: [indexPath], with: .none)
//        cryptoUITableView.reloadData()
//
//    }
    //
    
    // Tableview delegate and Data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return cryptoCurrencies.count
//        print("Crypto Count", cryptoCurrencies.count)
        return cryptoCurrencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.cellIdentifier, for: indexPath) as! CurrencyCell
        cell.updateCellUI(with: cryptoCurrencies[indexPath.row])
//        cell.currencyCellDelegate = self
//        cell.favorite_button.imageView?.image = cryptoCurrencies[indexPath.row].isFavorite ? UIImage(named: "yellowstar.png") : UIImage(named: "clearstar.png")
//        print("Cell for row at method called")
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
//        detailVC.modalTransitionStyle = .crossDissolve
//        detailVC.modalPresentationStyle = .fullScreen
//        present(detailVC, animated: false, completion: nil)
    }
    
    
    
    
    
    
}
