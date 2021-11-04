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
    var message = "Look for eample online"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.title = "ATM"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        checkUserLocationSetting()
        view.addSubview(mapView)
        mapConstraints()
    }
    
    
    // UI
    let mapView: MKMapView = {
    let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.showsUserLocation = true
        return map
    }()
    
    func mapConstraints() {
        mapView.delegate = self
        NSLayoutConstraint.activate([
//            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            mapView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            mapView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 400),
            mapView.widthAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    
    


}
