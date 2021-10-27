//
//  LocationViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/22.
//

import UIKit
import MapKit

class LocationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var locationTextField: UITextField!
    
    var locationManager: CLLocationManager = CLLocationManager()
    var location = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        
        locationManager.delegate = self
        congfigureLocationServices()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "등록", style: .plain, target: self, action: #selector(enrollUserLocation))
    
    }
    
    
    func congfigureLocationServices() {

        let status = locationManager.authorizationStatus

        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    
    @objc func enrollUserLocation() {
        
        if locationTextField != nil {
            
            let AC = UIAlertController(title: "위치가 등록되었어요!", message: "", preferredStyle: .alert)
            AC.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] _ in
                self.navigationController?.popViewController(animated: true)
                UserDefaults.standard.setValue(locationTextField.text, forKey: "위치")
            }))
           
            present(AC, animated: true, completion: nil)
           
        }
        
    }
    
    func goLocation(latitudeValue: CLLocationDegrees,
                       longtudeValue: CLLocationDegrees,
                       delta span: Double) -> CLLocationCoordinate2D {
           let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
           let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
           let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
           mapView.setRegion(pRegion, animated: true)
           return pLocation
       }
    
    func setAnnotation(latitudeValue: CLLocationDegrees,longitudeValue: CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubTitle:String) {
            let annotation = MKPointAnnotation()
            annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtudeValue: longitudeValue, delta: span)
            annotation.title = strTitle
            annotation.subtitle = strSubTitle
            mapView.addAnnotation(annotation)
        }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let first = locations.first else {
            return
        }
        _ = goLocation(latitudeValue: (first.coordinate.latitude),
                   longtudeValue: (first.coordinate.longitude),
                   delta: 0.01)
        
        print(first.coordinate.longitude)
        print(first.coordinate.latitude)
        
        // 경도, 위도 값을 지역으로 변환
        let geocorder = CLGeocoder()
        let locale = Locale(identifier: "Ko-kr")
        geocorder.reverseGeocodeLocation(first, preferredLocale: locale) { [self] (placemarks, error) in
            
            if error != nil {
                print("Error in reverseGeocodeLocation")
            }
            
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count > 0 {
                let placemark = placemarks![0]
                
                let locality = placemark.locality ?? ""
                let administrativeArea = placemark.administrativeArea ?? ""
                let country = placemark.country ?? ""
                
//                self.location = "\(locality), \(administrativeArea), \(country)"
//                self.location = "\(locality), \(administrativeArea)"
                print("Address: \(locality), \(administrativeArea), \(country)")
//                self.location = "\(locality), \(administrativeArea), \(country)"
                self.locationTextField.text = "\(locality), \(administrativeArea), \(country)"
            }
        }
    }
}
