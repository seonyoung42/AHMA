//
//  FacilitiesViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/17.
//

import UIKit

class FacilitiesViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var facilityList: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        
        let location = UserDefaults.standard.value(forKey: "위치")
        
        self.navigationItem.title = "내 주변 육아시설"
        
//        if location != nil {
//            self.navigationItem.title = location as! String
//        } else {
//            self.navigationItem.title = "위치 정보를 등록해주세요."
//        }
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))


        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: CGColor(red: 252/255, green: 243/255, blue: 202/255, alpha: 1))
            
        
        let path = Bundle.main.path(forResource: "totallist", ofType: "csv")!
        parseCSVAt(url: URL(fileURLWithPath: path))
        
        tableView.reloadData()
    }
    
    
    // - Parse CSV File
    private func parseCSVAt(url:URL) {
        facilityList = []
        
        do {
            let data = try Data(contentsOf: url)
            let dataEncoded = String(data: data, encoding: .utf8)
                
            if let dataArr = dataEncoded?.components(separatedBy: "\n").map({$0.components(separatedBy: ",")}) {
                    
                for item in dataArr {
                    facilityList.append(item)
//                    print("add facilityList")
                }
            }
            
        } catch {
            print("Error reading CSV file")
        }
    }
    
    // - Load Data from Parsed CSV File
//    private func loadBookListFromCSV() {
//
//        // commonChildPlayRoom1/ publicchildplace
//        let path = Bundle.main.path(forResource: "totallist", ofType: "csv")!
//        parseCSVAt(url: URL(fileURLWithPath: path))
//
//        tableView.reloadData()
//    }
    
    
    @IBAction func playRoomButtonTapped(_ sender: Any) {
        let path = Bundle.main.path(forResource: "totallist", ofType: "csv")!
        parseCSVAt(url: URL(fileURLWithPath: path))
        
        tableView.reloadData()
        
    }
    
    @IBAction func careRoomButtonTapped(_ sender: Any) {
        
        let path = Bundle.main.path(forResource: "publicchildplace", ofType: "csv")!
        parseCSVAt(url: URL(fileURLWithPath: path))
        
        tableView.reloadData()
    }
    
}

// - 테이블 뷰
extension FacilitiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return facilityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FacilityTableViewCell", for: indexPath) as! FacilityTableViewCell
        
        let age = facilityList[indexPath.row][2]
        
        cell.facilityName.text = facilityList[indexPath.row][0]
        cell.facilityAddress.text = facilityList[indexPath.row][5]
        cell.facilityPeriod.text = age
        
        if age == "초등학생" {
            cell.facilityImage.image = UIImage(named: "6-2")
        } else if age == "영유아" {
            cell.facilityImage.image = UIImage(named: "baby-1")
        }
        
        //시설명,자치구명,연령구분,X좌표값,Y좌표값,기본주소,상세주소,사이트유무,사이트url,사용료무료여부,사용료

        
        //시설ID,시설명,서비스분류코드,서비스분류,자치구코드,자치구명,연령구분코드,연령구분,X좌표값,Y좌표값,우편번호,기본주소,상세주소,사이트유무,사이트URL,사용료무료여부,사용료,평일시작시간,평일종료시간,사용시간구분코드,사용시간구분,시작시간1,종료시간1,시작시간2,종료시간2,시작시간3,종료시간3,토요일운영여부,토요일운영시작시간,토요일운영종료시간,등록일시,수정일시
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "FacilityDetailViewController") as? FacilityDetailViewController else { return }
        detailViewController.facility = facilityList[indexPath.row]
        self.show(detailViewController, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        2
//    }
}
