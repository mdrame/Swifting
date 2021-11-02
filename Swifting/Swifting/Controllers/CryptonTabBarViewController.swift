//
//  CryptonTabBarViewController.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/19/21.
//

import UIKit
import Foundation

class CryptonTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupViewControllers()
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func setupViewControllers() {
        let cryptosDashboardVC = DashBoardVC()
//        cryptosDashboardVC.title = "DashBoard"
        cryptosDashboardVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "chart.png"), selectedImage: UIImage(named: "chart.png"))
        
        let dashboardVC = UINavigationController(rootViewController: cryptosDashboardVC)
        
        let favCryptos = FavoritesVC()
//        favCryptos.title = "Favorite"
        favCryptos.tabBarItem = UITabBarItem(title: "FAVORITE", image: UIImage(named: "favorite.png"), selectedImage: UIImage(named: "favorite.png"))
        let favoriteCryptosVC = UINavigationController(rootViewController: favCryptos)
        
        let atmVc = ATMsViewController()
//        atmVc.title = "ATM"
        atmVc.tabBarItem = UITabBarItem(title: "ATM", image: UIImage(named: "atm.png"), selectedImage: UIImage(named: "atm.png"))
        let atmVC = UINavigationController(rootViewController: atmVc)
        
    //        viewControllers = [dashboardVC, favoriteCryptosVC, atmVc]
        self.setViewControllers([favoriteCryptosVC,dashboardVC, atmVC], animated: false)
        
       
    }

    
    

}
