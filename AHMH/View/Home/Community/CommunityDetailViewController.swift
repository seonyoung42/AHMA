//
//  CommunityDetailViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/25.
//

import UIKit

class CommunityDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   

    @IBOutlet var tableView: UITableView!
    var viewTitle : String?
    
    
    
    var communityDetails: [CommunityDetail]  = [
        
        .init(userImage: #imageLiteral(resourceName: "0-1"), userName: "1세 아기 엄마", userTime: "10분 전", title: "5개월 아기 질문 드려요~~", content: "이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? "),
        .init(userImage: #imageLiteral(resourceName: "0-1"), userName: "1세 아기 엄마", userTime: "10분 전", title: "5개월 아기 질문 드려요~~", content: "이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? "),
        .init(userImage: #imageLiteral(resourceName: "0-1"), userName: "1세 아기 엄마", userTime: "10분 전", title: "5개월 아기 질문 드려요~~", content: "이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? "),
        .init(userImage: #imageLiteral(resourceName: "0-1"), userName: "1세 아기 엄마", userTime: "10분 전", title: "5개월 아기 질문 드려요~~", content: "이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? "),
        .init(userImage: #imageLiteral(resourceName: "0-1"), userName: "1세 아기 엄마", userTime: "10분 전", title: "5개월 아기 질문 드려요~~", content: "이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? 이유식을 적게 먹는데 이정도 양이 적당한가요~? ")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.navigationItem.title = viewTitle
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        communityDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommunityDetailTableViewCell", for: indexPath) as! CommunityDetailTableViewCell
        cell.setup(communityDetail: communityDetails[indexPath.row])
        
        return cell
    }
 

}
