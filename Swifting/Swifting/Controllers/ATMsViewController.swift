//
//  ATMsViewController.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/19/21.
//

import UIKit
import MapKit
import CoreLocation

class ATMsViewController: UIViewController, MKMapViewDelegate {
    
    // MARK: Instances
    let locationManager = CLLocationManager()
    let networkingLayout = Networking()
    var message = "Look for eample online"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        self.title = "ATM NEAR BY"
        navigationController?.navigationBar.prefersLargeTitles = true
       
        
        checkUserLocationSetting()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "yellowstar"), style: .done, target: self, action: #selector(handleZipCode))
        view.addSubview(mapView)
        mapConstraints()
        // MARK: Zip code textfield bottom anchor is bound to MapView
//        view.addSubview(zipCode)
//        zipCodeConstraint()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        networkingLayout.fetchATMNearBy(withurl: .coinMap)
        
    }
    
    @objc func handleZipCode() {
        print("And textfield and delegate etc")
    }
    
    
    // UI
    
   
    
    let zipCode: UITextField = {
       let zipCodeTextField = UITextField()
        zipCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        zipCodeTextField.placeholder = "ZIP CODE"
        zipCodeTextField.textColor = UIColor.black
        zipCodeTextField.font = UIFont(name: "Arial", size: 25)
        zipCodeTextField.textAlignment = .center
        zipCodeTextField.layer.borderWidth =  3
        zipCodeTextField.layer.cornerRadius = 7
        zipCodeTextField.layer.borderColor = UIColor.gray.cgColor
        return zipCodeTextField
    }()
    
    func zipCodeConstraint() {
        NSLayoutConstraint.activate([
            zipCode.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            zipCode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110),
            zipCode.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -110),
            zipCode.bottomAnchor.constraint(equalTo: mapView.topAnchor, constant: -30)
        ])
    }
    
    let mapView: MKMapView = {
    let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.isScrollEnabled = true
        map.showsScale = true
        map.showsCompass = true
        map.showsTraffic = true
        map.showsBuildings = true
        return map
    }()
    
    func mapConstraints() {
        mapView.delegate = self
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
//            mapView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            mapView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    func addAnnotation() {
        let atm = MKPointAnnotation()
        atm.coordinate = CLLocationCoordinate2D(latitude: 38.8977, longitude: -77.0356)
        mapView.addAnnotations([atm])
    }
    
    


}
