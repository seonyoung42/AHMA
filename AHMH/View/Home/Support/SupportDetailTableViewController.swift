//
//  SupportDetailTableViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/24.
//

import UIKit

class SupportDetailTableViewController: UITableViewController {
    
    var supportTitle = ["누리과정(유아학비) 지원",
                        "소년소녀가정 지원",
                        "국공립어린이집 확충 지원",
                        "어린이집 조회",
                        "지역 박물관과 지역 어린이를 위한 찾아가는 박물관 체험 서비스",
                        "바른 식생활교육 지원(지자체사업)",
                        "어린이 국가예방접종 지원","취학전아동 실명 예방",
                        "한부모가족 아동양육비 지원",
                        "영유아 건강검진 서비스",
                        "영유아 대상 어린이집 식생활교육지원",
                        "저소득층 기저귀·조제분유 지원",
                        "미숙아 및 선천성이상아 의료비 지원",
                        "산후지원인력 가정방문서비스 지원 (1주)",
                        "청소년 방과후 돌봄지원(청소년방과후아카데미)",
                        "의료급여수급권자 영유아건강검진비 지원"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
//        
//        self.view.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
//      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return supportTitle.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SupportDetailTableViewCell", for: indexPath) as! SupportDetailTableViewCell
        
        cell.supportDetailLabel.text = supportTitle[indexPath.row]


        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class SupportDetailTableViewCell : UITableViewCell {
    
    @IBOutlet var supportDetailLabel: UILabel!
}
