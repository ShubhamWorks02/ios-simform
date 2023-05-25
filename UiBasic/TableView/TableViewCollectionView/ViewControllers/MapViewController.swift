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
        checkLocationService()
        mapview.mapType = .satellite
        mapview.isZoomEnabled = true
        centerLocation()
        cameraBoundary()
        // placeAnnotation()
        customAnnotation()
        // Do any additional setup after loading the view.
    }
    
    func checkLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuth()
        } else {
            print("disable")
        }
    }
    
    func checkLocationAuth() {
        switch CLLocationManager().authorizationStatus {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapview.showsUserLocation = true
            break
        case .denied:
            break
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            print("not")
            mapview.showsUserLocation = true
            break
        case .restricted:
            break
        }
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingHeading()
        manager.delegate = self
        
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
    
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is CustomAnnotation {
            let reuseId = "CustomAnnotation"
            var customView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
            if customView == nil {
                customView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                customView!.canShowCallout = true
            } else {
                customView!.annotation = annotation
            }
            guard let customAnnotation = annotation as? CustomAnnotation , let image = customAnnotation.image else {
                return nil
            }
            customView!.image = image
            return customView

        }else {
            return nil
        }
    }
}

class CustomAnnotation : MKPointAnnotation {
    var image: UIImage? = UIImage(named: "check")
}
