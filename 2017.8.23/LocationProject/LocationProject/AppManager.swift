//
//  AppManager.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 23/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CoreLocation

class AppManager: NSObject {
    static let shared = AppManager()
    
    let locationManager : CLLocationManager
    
    override init() {
        
        locationManager = CLLocationManager()
        
        super.init()
        
        locationManager.activityType = .automotiveNavigation
        locationManager.distanceFilter = 50 //meter //kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.delegate = self
    }
    
    func startLocation(){
        let authStatus = CLLocationManager.authorizationStatus()
        switch authStatus {
        case .restricted:
            return
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .notDetermined:
            //also background
            //locationManager.requestAlwaysAuthorization()
            //just foreground
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            //show alert
            let alert = UIAlertController(title: "Error", message: "Please authorize location services", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Nope", style: .cancel, handler: nil))
            func handler(_ action : UIAlertAction){
                guard let url = URL(string: UIApplicationOpenSettingsURLString) else{
                    return
                }
                
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            
            alert.addAction(UIAlertAction(title: "Settings", style: .destructive, handler: handler))
            
            let rootVC = UIApplication.shared.delegate?.window??.rootViewController
            rootVC?.present(alert, animated: true, completion: nil)
            
            
        }
    }
}

extension AppManager : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations[0])
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.startLocation()
    }
    
    
}























