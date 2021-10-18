//
//  FacilityDetailViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/17.
//

import UIKit
import MapKit
import SafariServices

class FacilityDetailViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        setAnnotation(latitudeValue: 37.3826616, longitudeValue: 126.840719, delta: 0.1, title: "물왕저수지 정통밥집", subtitle: "경기 시흥시 동서로857번길 6")
       
    }
    
    // 위도, 경도, 폭(span) 입력받아 지도에 표시
    func goLocation(latitudeValue: CLLocationDegrees,longtudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        mapView.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    // 특정 경도, 위도에 핀 설치하고 핀에 서브타이틀, 타이블 표시
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubTitle:String) {
            let annotation = MKPointAnnotation()
            annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtudeValue: longitudeValue, delta: span)
            annotation.title = strTitle
            annotation.subtitle = strSubTitle
            mapView.addAnnotation(annotation)
    }
    
    
    @IBAction func loadWebView(_ sender: Any) {
        
        let url = URL(string: "https://www.naver.com")
        let safariViewController = SFSafariViewController(url: url!)
        present(safariViewController, animated: true, completion: nil)
        
        
        // 사파리로 열기
//        let url = URL(string: "https://www.naver.com")
//        UIApplication.shared.open(url!, options: [:], completionHandler: nil)

    }
    
}
