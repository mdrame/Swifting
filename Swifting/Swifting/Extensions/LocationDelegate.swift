//
//  LocationDelegate.swift
//  Swifting
//
//  Created by Mohammed Drame on 11/4/21.
//

import Foundation
import CoreLocation
import MapKit

extension ATMsViewController: CLLocationManagerDelegate {
    
    func setuplocationmanager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    func checkUserLocationSetting() {
        if CLLocationManager.locationServicesEnabled() {
            // check permission status
            setuplocationmanager()
            checkPermissionStatus()
        } else {
            print("Please go to your phone setting and enable location service, to find ATM near by. ")
        }
    }
    
    func checkPermissionStatus() {
        switch locationManager.authorizationStatus {
        case .authorizedAlways:
            // fetch data
            atmMap.showsUserLocation = true
//            addAnnotation()
//            centerViewOnUserLocation()
            print("Fetch data")
        case .authorizedWhenInUse:
            // fetch data
            atmMap.showsUserLocation = true
//            addAnnotation()
//            centerViewOnUserLocation()
            print("Fetch data")
        case .denied:
            // diaplay reason/card.
            print("Denied")
        case .restricted:
            // display card
            print("Restricted")
        case .notDetermined:
            print("Denied")
        default:
            print("No permision selected")
//            centerViewOnUserLocation()
        }
    }
//    
//    func centerViewOnUserLocation() {
//        if let userCurrentLocation = locationManager.location?.coordinate {
//            let region = MKCoordinateRegion(center: userCurrentLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
//            atmMap.setRegion(region, animated: true)
//        }
//    }
//    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        checkUserLocationSetting()
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("Location updated")
//        // create region and set user last location
//        
//    }
    
    
    
    
    
}
