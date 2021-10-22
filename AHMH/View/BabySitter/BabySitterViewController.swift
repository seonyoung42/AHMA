//
//  BabySitterViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/17.
//

import UIKit

class BabySitterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        
        let location = UserDefaults.standard.value(forKey: "위치")
        
        if location != nil {
            self.navigationItem.title = location as! String
        } else {
            self.navigationItem.title = "위치 정보를 등록해주세요."
        }
        
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: CGColor(red: 252/255, green: 243/255, blue: 202/255, alpha: 1))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "BabySitterCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "BabySitterDetailViewController") as? BabySitterDetailViewController else { return }
        self.show(detailViewController, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

class BabySitterCell : UITableViewCell {
    
    @IBOutlet var babySitterImage: UIImageView!
    
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
    }
    
   
}
