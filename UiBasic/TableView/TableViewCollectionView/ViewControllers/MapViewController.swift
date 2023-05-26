//
//  MapViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 25/05/23.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak var mapview: MKMapView!
    // MARK: VARIABLES
    let manager = CLLocationManager()
    let initialLocation = CLLocation(latitude: 22.006053, longitude: 71.048570)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapview.delegate = self
        manager.delegate = self
        mapview.showsUserLocation = true
        mapview.mapType = .satellite
        mapview.isZoomEnabled = true
        centerLocation()
        cameraBoundary()
        checkLocationService()
//        manager.
        // placeAnnotation()
        
        customAnnotation()
        // Do any additional setup after loading the view.
    }
    
    func checkLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuth()
        } else {
           
        }
    }
    
    func createSettingsAlertController(title: String, message: String) {

          let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

          let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
          let settingsAction = UIAlertAction(title: NSLocalizedString("Settings", comment: ""), style: .default) { (UIAlertAction) in
              UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)! as URL, options: [:], completionHandler: nil)
          }

          alertController.addAction(cancelAction)
          alertController.addAction(settingsAction)
          self.present(alertController, animated: true, completion: nil)

       }
    func checkLocationAuth() {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapview.showsUserLocation = true
            break
        case .denied:
            print("denied")
            createSettingsAlertController(title: "Location needed", message: "please allo")
            break
        case .notDetermined:
//            manager.requestAlwaysAuthorization()
            manager.requestWhenInUseAuthorization()
            print("not")
            mapview.showsUserLocation = true
            break
        case .restricted:
            break
        }
//        switch manager.authorizationStatus {
//                    case .notDetermined:
//                        print("Not determined")
//                    case .restricted:
//                        print("Restricted")
//                    case .denied:
//                        print("Denied")
//                    case .authorizedAlways:
//                        print("Authorized Always")
//                    case .authorizedWhenInUse:
//            mapview.showsUserLocation = true
//                        print("Authorized When in Use")
//                    @unknown default:
//                        print("Unknown status")
//                    }
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingHeading()
        
        
    }
    
    func centerLocation() {
        let region = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
        mapview.setRegion(region, animated: true)
    }

    func cameraBoundary() {
        let region = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapview.setRegion(region, animated: true)
        mapview.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 2000)
        mapview.setCameraZoomRange(zoomRange, animated: true)
    }
    
    func placeAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.title = "Darshan Kingdom"
        annotation.coordinate = CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude)
        
        mapview.addAnnotation(annotation)
    }
    
    func customAnnotation() {
        let customAnnotation = CustomAnnotation()
        customAnnotation.title = "Darshan Vaadi"
        customAnnotation.coordinate = CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude)
        
        mapview.addAnnotation(customAnnotation)
    }
}

extension MapViewController: CLLocationManagerDelegate {
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        //checkLocationService()
//    }
//
    
}

extension MapViewController: MKMapViewDelegate {
    
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard !(annotation is MKUserLocation) else {
                return nil
            }
            
            let reuseIdentifier = "CustomAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
                annotationView!.canShowCallout = true
            } else {
                annotationView!.annotation = annotation
            }
            
            if let customAnnotation = annotation as? CustomAnnotation,
               let image = customAnnotation.image {
                annotationView!.image = image
            }
            
            return annotationView
        }

}

class CustomAnnotation : MKPointAnnotation {
    var image: UIImage? = UIImage(named: "check")
}
