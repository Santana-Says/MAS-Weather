import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }
    
    func requestLocationPermission() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.requestWhenInUseAuthorization()
        } else {
            print("Location services are not enabled")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
            case .notDetermined:
                print("Location permission not determined yet")
            case .restricted, .denied:
                print("Location permission denied")
            case .authorizedWhenInUse, .authorizedAlways:
                print("Location permission granted")
            case .authorized:
                print("Location permission granted (deprecated on iOS 14+)")
            @unknown default:
                print("Unknown location permission status")
        }
    }
}
