//
//  ATMDetailVC.swift
//  Swifting
//
//  Created by Mohammed Drame on 11/27/21.
//

import UIKit

class ATMDetailVC: UIViewController {
    // Instances
    var atmID: String?
    fileprivate let networking = Networking()
    var venueAtm: AtmVenue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atmDetailsWrapView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        viewLayerStuff()
        viewGesuture()
        fetchAtm()
    }
    override func viewWillAppear(_ animated: Bool) {
        
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
    func fetchAtm() {
        print("Featching atm  📡")
        guard let idInt = atmID else { return }
        print("atmID :", idInt)
        let converIdToDouble = Double(idInt) ?? 1.0
        let convertIdToInt = Int(converIdToDouble) ?? 1
        networking.fetchATM(with: .atm, at: convertIdToInt) { [self] (completed) in
            DispatchQueue.main.async {
                switch completed {
                case .success(let venue):
                    self.upateVenueUI(object: venue.venue)
                    print("Venue downloaded  ✅")
                case .failure(let error):
                    print("No venue after networking ‼️")
                }
               
            }
        }
//        self.atmDetailsWrapView.reloadInputViews()
    }
    
    private func upateVenueUI(object: AtmVenue? ) {
        name.text = "🏧: \(object!.name!)"
      
    }
    
    @IBAction func callAtmLocation(_ sender: UIButton) {
    }
    
    @IBAction func getDirection(_ sender: UIButton) {
    }
    
    
    
}
