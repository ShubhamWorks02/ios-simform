//
//  SecondMapViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 26/05/23.
//

import UIKit
import MapKit
import CoreLocation

class SecondMapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var userLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Set up MKMapView
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        // Check location services and request authorization
        checkLocationServices()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // locationManager.requestWhenInUseAuthorization()
    }

}

extension SecondMapViewController {
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuth()
        } else {
            getPermissionFromUser(title: "Permission", message: "Please Grant")
        }
    }
    
    func checkLocationAuth() {
        
        let authorizationStatus: CLAuthorizationStatus
        if #available(iOS 14.0, *) {
            authorizationStatus = locationManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        
        switch authorizationStatus {
        case .denied:
            print("Denied")
            showLocationDeniedAlert()
            break
            
        case .authorizedAlways,.authorizedWhenInUse:
            print("while using the app")
            locationManager.startUpdatingLocation()
            break
            
        case .restricted:
            showRestrictedAlert()
            break
            
        case .notDetermined:
            print("not determined")
            
            break
            
        default:
            break
        }
        
    }
    
    func showLocationDeniedAlert() {
        let alert = UIAlertController(title: "Location Access Denied", message: "Please grant location access to use this app.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showRestrictedAlert() {
        let alert = UIAlertController(title: "Location Access Restricted", message: "Location access is restricted on this device.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func getPermissionFromUser(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: NSLocalizedString("Settings", comment: ""), style: .default) { (UIAlertAction) in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)! as URL, options: [:], completionHandler: nil)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
}

extension SecondMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuth()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        // Update user's current location
        userLocation = location

        // Do something with the updated location
        print("Current location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
    }
}

extension SecondMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        // Zoom the map to the user's current location
        if let location = userLocation.location {
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    
}
