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
            self.navigationItem.title = location
//            countryName.text = location
        }
    }
    
    var locationManager: CLLocationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congfigureLocationServices()
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))


        self.navigationItem.title = location
//        self.countryName.text = location
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "facilityCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
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
        let locale = Locale(identifier: "Ko-kr")
        geocorder.reverseGeocodeLocation(first, preferredLocale: locale) { (placemarks, error) in
            
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
    @IBOutlet var cellView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        
//        self.cellView.layer.borderWidth = 2
//        self.cellView.layer.borderColor = CGColor(red: 255/255, green: 146/255, blue: 146/255, alpha: 1)
        self.cellView.layer.cornerRadius = 30
        
        
//        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shouldRasterize = true
        contentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        contentView.layer.shadowRadius = 10
//        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = false
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))

        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = CGColor(red: 255/255, green: 146/255, blue: 146/255, alpha: 1)
        contentView.layer.cornerRadius = 30
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
                contentView.layer.borderWidth = 2
                contentView.layer.borderColor = CGColor(red: 196/255, green: 234/255, blue: 218/255, alpha: 1)
            } else {
                contentView.layer.borderWidth = 2
                contentView.layer.borderColor = CGColor(red: 255/255, green: 146/255, blue: 146/255, alpha: 1)
            }
    }
}
