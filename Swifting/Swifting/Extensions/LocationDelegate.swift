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
        locationManager.requestWhenInUseAuthorization()
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
        case .authorizedAlways:
            // fetch data
            atmMap.showsUserLocation = true
            addAnnotation()
//            centerMapOnUserLocation()
            print("Fetch data")
        case .authorizedWhenInUse:
            // fetch data
            atmMap.showsUserLocation = true
            addAnnotation()
//            centerMapOnUserLocation()
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
    func centerMapOnUserLocation() {
        if let userCurrentLocation = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: userCurrentLocation, latitudinalMeters: 6000, longitudinalMeters: 6000)
            atmMap.setRegion(region, animated: true)
        }
    }
    //
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkUserLocationSetting()
    }
    //
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location updated")
        // create region and set user last location
 
            locationManager.stopUpdatingLocation()
            
        
    }
    
//    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        var annotationView = atmMap.dequeueReusableAnnotationView(withIdentifier: "custom")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom") as! MKAnnotationView
//            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "atmblue.png")
//        let leftView = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        leftView.backgroundColor = .red
//        leftView.imageView?.image = UIImage(named: "atm.png")
//        annotationView?.rightCalloutAccessoryView = leftView
        
//        annotationView?.canShowCallout = true
        return annotationView
        
        
    }
    
    
    
    
}
