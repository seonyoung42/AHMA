//
//  BabySitterViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/17.
//

import UIKit

class BabySitterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet var tableView: UITableView!
    
    var babySitters: [BabySitter] = [
        
        .init(profileImage: UIImage(named: "profileImage5")!, name: "장선영", age: "25세", location: "서울시 성동구", instruction: "돌보미 경력 2년차입니다."),
        .init(profileImage: UIImage(named: "profileImage1")!, name: "곽예영", age: "24세", location: "서울시 성동구", instruction: "경험이 많은 돌보미입니다."),
        .init(profileImage: UIImage(named: "profileImage3")!, name: "이지혜", age: "23세", location: "서울시 성동구", instruction: "항상 미소를 짓고 있습니다."),
        .init(profileImage: UIImage(named: "profileImage4")!, name: "박수린", age: "23세", location: "서울시 성동구", instruction: "유아교육과 실습 경험이 있습니다"),
        .init(profileImage: UIImage(named: "profileImage1")!, name: "곽예영", age: "25세", location: "서울시 성동구", instruction: "경험이 많은 돌보미입니다."),
        .init(profileImage: UIImage(named: "profileImage6")!, name: "장재희", age: "23세", location: "서울시 성동구", instruction: "내 동생, 내 아이처럼 돌볼 수 있습니다."),
        .init(profileImage: UIImage(named: "profileImage2")!, name: "곽지원", age: "22세", location: "서울시 성동구", instruction: "아이를 좋아하는 돌보미입니다."),
        .init(profileImage: UIImage(named: "profileImage7")!, name: "방예린", age: "24세", location: "서울시 성동구", instruction: "아이의 성장을 함께하고 싶습니다")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        
        self.view.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        
        let location = UserDefaults.standard.value(forKey: "위치")
        
//        if location != nil {
//            self.navigationItem.title = location as! String
//        } else {
//            self.navigationItem.title = "위치 정보를 등록해주세요."
//        }
        
        self.navigationItem.title = "내 근처 돌보미"
        
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: CGColor(red: 252/255, green: 243/255, blue: 202/255, alpha: 1))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        babySitters.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BabySitterCell", for: indexPath) as! BabySitterCell
        
        cell.setup(babySitter: babySitters[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "BabySitterDetailViewController") as? BabySitterDetailViewController else { return }
        detailViewController.babySitter = babySitters[indexPath.row]
        self.show(detailViewController, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

class BabySitterCell : UITableViewCell {

    @IBOutlet var babySitterImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var age: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var instruction: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))


        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shouldRasterize = true
        contentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        contentView.layer.shadowRadius = 10
        contentView.layer.masksToBounds = false
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))

        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = CGColor(red: 196/255, green: 234/255, blue: 218/255, alpha: 1)
        contentView.layer.cornerRadius = 30
        
        babySitterImage.cornerRadius = babySitterImage.bounds.width/2
        babySitterImage.layer.borderWidth = 3
        babySitterImage.layer.borderColor = CGColor(red: 210/255, green: 230/255, blue: 245/255, alpha: 1)
    }
    
    func setup(babySitter: BabySitter) {
        
        babySitterImage.image = babySitter.profileImage
        name.text = babySitter.name
        age.text = babySitter.age
        address.text = babySitter.location
        instruction.text = babySitter.instruction
        
    }

}
