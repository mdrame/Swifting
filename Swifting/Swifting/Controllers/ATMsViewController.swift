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
//    var message = "Look for eample online"
    // MARK: Global
    var listOfAtms :[Venue] = [] {
        willSet {
//            print("ATM Instance added to array")
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //        view.addSubview(mapView)
        //        mapConstraints()
        // MARK: Zip code textfield bottom anchor is bound to MapView
        //        view.addSubview(zipCode)
        //        zipCodeConstraint()
        zipCodeShadow()
        dismissKeyboard()
        cityName.delegate = self
        print("Map vc didLoad")
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Map vc appear")
        view.addSubview(spinner)
        spinnerConstraint()
        spinner.startAnimating()
        getAtms()
    }
    
    func fetchAtm() {
        print("Featching venue  📡")
//        guard let idInt = atmID else { return }
        print("atmID :", 10)
//        let converIdToDouble = Double(idInt) ?? 1.0
        let convertIdToInt = 10
        networkingLayout.fetchATM(with: .atmNearby, at: convertIdToInt, completion: { (completed) in
            DispatchQueue.main.async {
                
                switch completed {
                case .success(let atm):
                    print(atm)
                    print("Suceeded ✅")
                    
                case .failure(let failed):
                    print("Failed to fetch ")
                }
            }
        })
    }
    
     func getAtms() {
        checkUserLocationSetting()
        
             self.networkingLayout.fetchATMNearBy(withurl: .coinMap) { [self] atmsNearby in
                 DispatchQueue.main.async {
                     spinner.stopAnimating()
                for i in atmsNearby.venues {
//                    print("Name:", i.name)
//                    print("Lat:", i.lat)
//                    print("Lon:", i.lon)
                    let name = i.name
                    let lat = i.lat
                    let lon = i.lon
                    self.listOfAtms.append(Venue(id: i.id, lat: lat, lon: lon, category: i.category, name: name, created_on: i.created_on, geolocation_degrees: i.geolocation_degrees))
                }
                 print("Done fitching atms near by")
                     self.addAnnotation()
                     self.atmMap.reloadInputViews()
             }
             
        }
         
    }
//
    
    
    
    // UI
    @IBOutlet weak var atmMap: MKMapView!
    
    @IBOutlet weak var cityName: UITextField!
    
    
    private func zipCodeShadow() {
        cityName.layer.shadowOpacity = 10
        cityName.layer.shadowRadius = 6.0
        cityName.layer.shadowOffset = CGSize.zero // Use any CGSize
        cityName.layer.shadowColor = UIColor.gray.cgColor
    }
    
    private func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(resignKeyboard))
        atmMap.addGestureRecognizer(tap)
    }
    
    @objc func resignKeyboard() {
        cityName.resignFirstResponder()
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
        for location in listOfAtms {
//            print(location)
            let annotation = MKPointAnnotation()
            annotation.title = String(location.id!)
//            annotation.subtitle = "Business info"
            annotation.coordinate = CLLocationCoordinate2D(latitude: Double(location.lat), longitude: Double(location.lon))
            //            annotation.coordinate = CLLocationCoordinate2D(latitude: 40.718983, longitude: -74.190154)
            
            atmMap.addAnnotation(annotation)
            atmMap.reloadInputViews()
//            atmMap.ann
        }
    }
    
    
    
    
}
