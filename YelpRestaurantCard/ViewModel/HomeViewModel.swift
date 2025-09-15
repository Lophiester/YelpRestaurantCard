//
//  HomeViewModel.swift
//  YelpRestaurantCard
//
//  Created by Charles Yamamoto on 2025/09/16.
//

import Foundation
import CoreLocation

@Observable
class HomeViewModel: NSObject, CLLocationManagerDelegate{
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D?
    var locationAuthStatus: CLAuthorizationStatus = .notDetermined
    
    
    var restaurant = [Business]()
    var currentIndex: Int = 0
    var service = DataService()
    var offsetX: CGFloat = 0
    
    override init() {
        super.init( )
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
    }
    
    func getRestaurantData() {
        Task{
            do{
                restaurant = try await service.fetchRestaurants(userLocation: currentLocation)
            }catch{
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    func getUserLocation()  {
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            currentLocation = nil
            locationManager.requestLocation()
        } else{
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationAuthStatus = manager.authorizationStatus
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentLocation = nil
            manager.requestLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if currentLocation == nil {
            currentLocation = locations.last?.coordinate
        
            manager.stopUpdatingLocation()
           
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    
}
