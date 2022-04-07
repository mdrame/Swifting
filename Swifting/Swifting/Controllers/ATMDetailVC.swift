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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atmDetailsWrapView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        viewLayerStuff()
        viewGesuture()
        fetchAtm()
    }
    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(spinner)
        spinnerConstraint()
        spinner.startAnimating()
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
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var call: UIButton!
    @IBOutlet weak var direction: UIButton!
    
    fileprivate func viewLayerStuff() {
        // call buton
        call.layer.cornerRadius = 5
        // directionButton
        direction.layer.cornerRadius = 5
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
                    self.spinner.stopAnimating()
                    self.upateVenueUI(object: venue.venue)
                    print("Venue downloaded  ✅")
                case .failure(let error):
                    print("No venue after networking ‼️")
                }
               
            }
        }
//        self.atmDetailsWrapView.reloadInputViews()
    }
    
    private func upateVenueUI(object: AtmVenue ) {
        name.text = object.name ?? "Unavailable"
//        address.text = "\(object.street,object.city,object.state,object.postcode)" ?? "Unavailable"
        phone.text = object.phone ?? "Unavailable"
        website.text = object.website ?? "Unavailable"
        email.text = object.email ?? "Unavailable"
    }
    
    @IBAction func callAtmLocation(_ sender: UIButton) {
    }
    
    @IBAction func getDirection(_ sender: UIButton) {
    }
    
    
    
}
