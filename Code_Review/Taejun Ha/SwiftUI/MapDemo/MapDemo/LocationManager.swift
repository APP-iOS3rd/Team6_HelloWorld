//
//  LocationManager.swift
//  MapDemo
//
//  Created by Taejun Ha on 1/2/24.
//

import Foundation
import CoreLocation

class LocationManager {
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    func requestLocationPermission() {
        // 권한 요청
        locationManager.requestWhenInUseAuthorization()
    }
    
    func getCurrentLocation() {
        // startUpdating하면 현재 위치를 계속 업데이트함
        locationManager.startUpdatingLocation()
        currentLocation = locationManager.location
    }
}
