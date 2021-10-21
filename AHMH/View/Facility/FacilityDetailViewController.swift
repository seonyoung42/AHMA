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
    
    @IBOutlet var facilityName: UITextField!
    @IBOutlet var facilityAddress: UITextField!
    
    var facility : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
//        setAnnotation(latitudeValue: 37.3826616, longitudeValue: 126.840719, delta: 0.1, title: "물왕저수지 정통밥집", subtitle: "경기 시흥시 동서로857번길 6")
        
        //시설ID,시설명,서비스분류코드,서비스분류,자치구코드,자치구명,연령구분코드,연령구분,X좌표값,Y좌표값,우편번호,기본주소,상세주소,사이트유무,사이트URL,사용료무료여부,사용료,평일시작시간,평일종료시간,사용시간구분코드,사용시간구분,시작시간1,종료시간1,시작시간2,종료시간2,시작시간3,종료시간3,토요일운영여부,토요일운영시작시간,토요일운영종료시간,등록일시,수정일시
        
        //시설명,자치구명,연령구분,X좌표값,Y좌표값,기본주소,상세주소,사이트유무,사이트url,사용료무료여부,사용료

        
        
        let adrress = facility[5]
        let detailAdress = facility[6]
        let name = facility[0]
        let longitude = facility[3]
        let latitude = facility[4]
        
        facilityName.text = name
        facilityAddress.text = adrress
        
//        setAnnotation(latitudeValue: 37.3826616, longitudeValue: 126.840719, delta: 0.1, title: name, subtitle: adrress)
        
        setAnnotation(latitudeValue: Double(latitude)!, longitudeValue: Double(longitude)! , delta: 0.1, title: name, subtitle: adrress)
       
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
