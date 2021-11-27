//
//  ATMDetailVC.swift
//  Swifting
//
//  Created by Mohammed Drame on 11/27/21.
//

import UIKit

class ATMDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        atmDetailsWrapView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        dismissDetail()
    }
    
    @IBOutlet weak var atmDetailsWrapView: UIView!
    
    func dismissDetail() {
        let tapView = UITapGestureRecognizer(target: self, action: #selector(dismissAtmDetailView))
        view.addGestureRecognizer(tapView)
    }
    
    @objc func dismissAtmDetailView() {
        self.dismiss(animated: true, completion: nil)
    }
   
    // Info - Label
    // Business Name, addy,
    // ATM Details - Label
    // Operator, website, phone, email
    // Trading coins - UIImage // in a stack view
    // get directiion button
    
  

}
