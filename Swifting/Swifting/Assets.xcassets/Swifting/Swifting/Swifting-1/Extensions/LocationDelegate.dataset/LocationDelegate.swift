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
            print("Location Services Not enable on device ")
            //            show alert letting user know they have to turn location service on
            let alert = UIAlertController(title: "Location is off", message: "Please go to setting and turn on location service", preferredStyle: .alert)
            // add setting button next to ok 📌
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func checkPermissionStatus() {
        switch locationManager.authorizationStatus {
        case .authorizedAlways:
            // fetch data
            atmMap.showsUserLocation = true
            centerMapOnUserLocation()
            print("Fetch data")
            
        case .authorizedWhenInUse:
            // fetch data
            atmMap.showsUserLocation = true
            centerMapOnUserLocation()
//            print("Fetch data")
            break
        case .denied:
            // diaplay reason/card.
            locationManager.requestWhenInUseAuthorization()
            print("Denied")
            
        case .restricted:
            // display card
            locationManager.requestWhenInUseAuthorization()
            print("Restricted")
            
        case .notDetermined:
            print("Denied")
            
        default:
            print("No permision selected")
           
        }
    }
    //
    func centerMapOnUserLocation() {
        if let userCurrentLocation = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: userCurrentLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
            atmMap.setRegion(region, animated: true)
            print("Map centered on user current location")
        } else {
            checkUserLocationSetting()
        }
    }
    //
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkUserLocationSetting()
    }
    //
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("Location updated")
//        // create region and set user last location
//
//        locationManager.stopUpdatingLocation()
//    }
//
    /// Custom map annotation design
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard !(annotation is MKUserLocation) else { return nil }
//        var annotationView = atmMap.dequeueReusableAnnotationView(withIdentifier: "custom")
//        if annotationView == nil {
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom") as! MKAnnotationView
//            //            annotationView?.canShowCallout = true
//        } else {
//            annotationView?.annotation = annotation
//        }
//        annotationView?.image = UIImage(named: "cryptonMap.png")
//        return annotationView
//    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(calloutTapped(sender:)))
        gesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(gesture)
    }
    
    @objc func calloutTapped(sender:UITapGestureRecognizer) {
        guard let annotation = (sender.view as? MKAnnotationView)?.annotation else { return }
        let selectedLocation: CLLocationCoordinate2D
        let atmIDString = annotation.title
        selectedLocation = annotation.coordinate
        print(selectedLocation.longitude, selectedLocation.latitude, "Did Select ATM")
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destination = storyBoard.instantiateViewController(withIdentifier: "atmDetail") as? ATMDetailVC else {
            print("Can't find ATM DetailView to perferm segue")
            return
        }
        destination.atmID = atmIDString!!
        self.present(destination, animated: true, completion: nil)
    
    }
    
    
    
    
    
    
    
}
