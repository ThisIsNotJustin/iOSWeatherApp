//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Justin on 5/2/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isloading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isloading = true
        manager.requestLocation()
    }
    
    // location success
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.first?.coordinate
        self.isloading = false
        

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isloading = false
    }
}
