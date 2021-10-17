//
//  FacilitiesViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/17.
//

import UIKit
import CoreLocation

class FacilitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var countryName: UILabel!
    
    var location = "서울" {
        didSet {
            countryName.text = "\(location)"
        }
    }
    
    var locationManager: CLLocationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congfigureLocationServices()
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "facilityCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "FacilityDetailViewController") as? FacilityDetailViewController else { return }
//        detailViewController.facilityImage =
//        detailViewController.diaryDetail = diaryList[indexPath.row]
//        detailViewController.ref = self.ref
//        detailViewController.diaryCount = self.diaryList.count
        self.show(detailViewController, sender: nil)
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let first = locations.first else {
//            return
//        }
//
//        print(first.coordinate.longitude)
//        print(first.coordinate.latitude)
//
//        let geocorder = CLGeocoder()
//        geocorder.reverseGeocodeLocation(first) { (placemarks, error) in
//
//            if error != nil {
//                print("Error in reverseGeocodeLocation")
//            }
//
//            let placemark = placemarks! as [CLPlacemark]
//            if placemark.count > 0 {
//                let placemark = placemarks![0]
//
//                let locality = placemark.locality ?? ""
//                let administrativeArea = placemark.administrativeArea ?? ""
//                let country = placemark.country ?? ""
//
//                self.location = "\(locality), \(administrativeArea), \(country)"
//                print("Address: \(locality), \(administrativeArea), \(country)")
//            }
//        }
//
//    }
//    func congfigureLocationServices() {
//
//        let status = locationManager.authorizationStatus
//
//        if status == .notDetermined {
//            locationManager.requestAlwaysAuthorization()
//        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            locationManager.startUpdatingLocation()
//        }
//    }
}


extension FacilitiesViewController : CLLocationManagerDelegate {
    
    func congfigureLocationServices() {
        
        let status = locationManager.authorizationStatus
        
        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else {
            return
        }
        
        print(first.coordinate.longitude)
        print(first.coordinate.latitude)
        
        // 경도, 위도 값을 지역으로 변환
        let geocorder = CLGeocoder()
        geocorder.reverseGeocodeLocation(first) { (placemarks, error) in
            
            if error != nil {
                print("Error in reverseGeocodeLocation")
            }
            
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count > 0 {
                let placemark = placemarks![0]
                
                let locality = placemark.locality ?? ""
                let administrativeArea = placemark.administrativeArea ?? ""
                let country = placemark.country ?? ""
                
                self.location = "\(locality), \(administrativeArea), \(country)"
                print("Address: \(locality), \(administrativeArea), \(country)")
            }
        }
    }
}

class FacilityCell : UITableViewCell {
    @IBOutlet var facilityImage: UIImageView!
    @IBOutlet var facilityName: UILabel!
    @IBOutlet var facilityAddress: UILabel!
    @IBOutlet var facilityPeriod: UILabel!
}
