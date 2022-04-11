//
//  FavoritesVC.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/19/21.
//

import UIKit

class FavoritesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.title = "Favorite Currencies"
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var favoriteCurrenciesTableView: UITableView!
    
    // TablevView Delegates and Data source
    
    
    // Tableview delegate and Data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return cryptoCurrencies.count
//        print("Crypto Count", cryptoCurrencies.count)
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.cellIdentifier, for: indexPath) as! FavoriteCell
//        cell.updateCellUI(with: cryptoCurrencies[indexPath.row])
//        cell.currencyCellDelegate = self
//        cell.favorite_button.imageView?.image = cryptoCurrencies[indexPath.row].isFavorite ? UIImage(named: "yellowstar.png") : UIImage(named: "clearstar.png")
//        print("Cell for row at method called")
        //        cell.selectionStyle = .blue
        return cell
    }
    
    
    
    
    



}
