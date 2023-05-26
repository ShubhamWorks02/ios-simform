////
////  SimulatorLocationManager.swift
////  TableViewCollectionViewCollectionView
////
////  Created by Shubham Bhatt on 26/05/23.
////
//import Foundation
//import CoreLocation
//
//class SimulatorLocationManager: NSObject, CLLocationManagerDelegate {
//    static let shared = SimulatorLocationManager()
//    
//    private override init() {
//        super.init()
//        locationManager?.startUpdatingLocation()
//    }
//    
//    private var locationManager: CLLocationManager?
//    private var currentLocation: CLLocation?
//    private var locationCompletionHandler: ((CLLocation?) -> Void)?
//    
//    
//    func startUpdatingLocation(completion: @escaping (CLLocation?) -> Void) {
//        locationManager?.requestWhenInUseAuthorization()
//        locationManager = CLLocationManager()
//        locationManager?.delegate = self
//        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager?.startUpdatingLocation()
//        
//        locationCompletionHandler = completion
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last {
//            currentLocation = location
//            locationCompletionHandler?(currentLocation)
//            locationCompletionHandler = nil
//        }
//    }
//    
//    func getUserLocation() ->  {
//        if currentLocation != nil {
//            completion(currentLocation)
//        } else {
//            locationCompletionHandler = completion
//        }
//    }
//    
//    func getUserCoordinate(completion: @escaping (CLLocationCoordinate2D?) -> Void) {
//        if let location = currentLocation {
//            completion(location.coordinate)
//        } else {
//            getUserLocation { location in
//                completion(location?.coordinate)
//            }
//        }
//    }
//}
