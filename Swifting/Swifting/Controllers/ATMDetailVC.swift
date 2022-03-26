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
        viewLayerStuff()
        viewGesuture()
    }
    private func viewGesuture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissAtmDetailView))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissAtmDetailView() {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: UIKit Stuff
    @IBOutlet weak var atmDetailsWrapView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var operationHrs: UILabel!
    @IBOutlet weak var contact: UILabel!
    @IBOutlet weak var atmOperator: UILabel!
    @IBOutlet weak var operatorEmail: UILabel!
    @IBOutlet weak var operatorWebsite: UILabel!
    @IBOutlet weak var longitudeAndlatitude: UILabel!
    @IBOutlet weak var since: UILabel!
    @IBOutlet weak var call: UIButton!
    @IBOutlet weak var direction: UIButton!
    
    fileprivate func viewLayerStuff() {
        // call buton
        call.layer.cornerRadius = 5
        // directionButton
        direction.layer.cornerRadius = 5
    }
    
    
    
   
    // Business Name
    // -------------------
    // Address
    // -------------------
    // ATM Details - Label
    // -------------------
    // Operator, website, phone, email, manufacturer
    // -------------------
    // Additional info
    // Trading coins - UIImage // in a stack view
    // get directiion button
    
    @IBAction func callAtmLocation(_ sender: UIButton) {
    }
    
    @IBAction func getDirection(_ sender: UIButton) {
    }
    
  

}
