//
//  LocationDelegate.swift
//  Swifting
//
//  Created by Mohammed Drame on 11/4/21.
//

import Foundation
import CoreLocation

extension ATMsViewController: CLLocationManagerDelegate {
    
    func setuplocationmanager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
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
        case .authorized:
            // fetch data
            print("Fetch data")
        case .authorizedWhenInUse:
            // fetch data
            print("Fetch data")
        case .denied:
            // diaplay reason/card.
            print("Denied")
        case .restricted:
            // display card
            print("Restricted")
        default:
            print("No permision selected")
        }
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkUserLocationSetting()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location updated")
    }
    
    
    
    
    
}
