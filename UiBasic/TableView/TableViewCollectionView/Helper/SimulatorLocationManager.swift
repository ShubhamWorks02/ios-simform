//
//  SimulatorLocationManager.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 26/05/23.
//
import Foundation
import CoreLocation

class SimulatorLocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = SimulatorLocationManager()

    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocation?

    var userLocation: CLLocation? {
        return currentLocation
    }

    private override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            currentLocation = location
        }
    }
}
