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
            //            show alert letting user know they have to turn location service on
            let alert = UIAlertController(title: "Location is off", message: "Please go to setting and turn on location service", preferredStyle: .alert)
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
            addAnnotation()
            centerMapOnUserLocation()
            print("Fetch data")
        case .authorizedWhenInUse:
            // fetch data
            atmMap.showsUserLocation = true
            addAnnotation()
            centerMapOnUserLocation()
            print("Fetch data")
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
            //            centerViewOnUserLocation()
        }
    }
    //
    func centerMapOnUserLocation() {
        print("Map centered on user current locationd")
        if let userCurrentLocation = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: userCurrentLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
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
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(calloutTapped(sender:)))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func calloutTapped(sender:UITapGestureRecognizer) {
        guard let annotation = (sender.view as? MKAnnotationView)?.annotation else { return }
        let selectedLocation: CLLocationCoordinate2D
        selectedLocation = annotation.coordinate
        print("Pop up view")
        performSegue(withIdentifier: "atmDetail", sender: self)
    }
    
    
    
    
    
    
    
}
