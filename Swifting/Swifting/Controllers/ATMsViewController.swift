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
    // MARK: Global
    var listOfAtms = [Venue]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //        self.title = "ATM NEAR BY"
        navigationController?.navigationBar.prefersLargeTitles = true
        //        view.addSubview(mapView)
        //        mapConstraints()
        // MARK: Zip code textfield bottom anchor is bound to MapView
        //        view.addSubview(zipCode)
        //        zipCodeConstraint()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Map vc appear")
        checkUserLocationSetting()
        networkingLayout.fetchATMNearBy(withurl: .coinMap) { atmsNearby in
            DispatchQueue.main.async {
                //                print("Atms data in VC: ",atmsNearby.venues)
                for i in atmsNearby.venues {
                    print("Name:", i.name)
                    print("Lat:", i.lat)
                    print("Lon:", i.lon)
                    let name = i.name
                    let lat = i.lat
                    let lon = i.lon
                    self.listOfAtms.append(Venue(id: i.id, lat: lat, lon: lon, category: i.category, name: name, created_on: i.created_on, geolocation_degrees: i.geolocation_degrees))
                }
            }
        }
        
    }
    
    
    
    
    // UI
    @IBOutlet weak var atmMap: MKMapView!
    
    
    
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
            zipCode.bottomAnchor.constraint(equalTo: atmMap.topAnchor, constant: -30)
        ])
    }
    
    let atmsMap: MKMapView = {
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
        atmMap.delegate = self
        NSLayoutConstraint.activate([
            atmMap.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            atmMap.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            //            mapView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            //            mapView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            atmMap.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            atmMap.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    func addAnnotation() {
//        for location in listOfAtms {
            let annotation = MKPointAnnotation()
            annotation.title = "Crypton"
            annotation.subtitle = "Business info"
//            annotation.coordinate = CLLocationCoordinate2D(latitude: Double(location.lat), longitude: Double(location.lon))
            annotation.coordinate = CLLocationCoordinate2D(latitude: 40.718983, longitude: -74.190154)

            atmMap.addAnnotation(annotation)
//        }
    }
    
    
    
    
}
