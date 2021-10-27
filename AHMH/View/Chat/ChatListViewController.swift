//
//  ChatListViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/19.
//

import UIKit
import FirebaseAuth
import JGProgressHUD


class ChatListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    private let spinner = JGProgressHUD(style: .dark)
    
    var chatLists: [ChatList] = [
        .init(profileImage: #imageLiteral(resourceName: "profileImage5"), name: "장선영", lastChat: "안녕하세요!", time: "오전 11:54"),
        .init(profileImage: #imageLiteral(resourceName: "profileImage2"), name: "곽예영", lastChat: "4시쯤 시간 괜찮으실까요?...", time: "오전 10:49"),
        .init(profileImage: #imageLiteral(resourceName: "profileImage3"), name: "이지원", lastChat: "아이가 좋아했어요 감사합니다!.", time: "오전 9:30"),
        .init(profileImage: #imageLiteral(resourceName: "profileImage6"), name: "박수린", lastChat: "수고많으셨습니다!", time: "오전 9:10"),
        .init(profileImage: #imageLiteral(resourceName: "profileImage1"), name: "장재희", lastChat: "다음에 뵐게요!..", time: "오전 8:20"),
        .init(profileImage: #imageLiteral(resourceName: "profileImage7"), name: "곽지원", lastChat: "날씨가 춥네요 감기조심하세요 :)", time: "오후 11:19")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: CGColor(red: 252/255, green: 243/255, blue: 202/255, alpha: 1))
        self.navigationItem.title = "돌보미 채팅 목록"
//        self.tableView.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        
        tableView.delegate = self
        tableView.dataSource = self
        fetchConversations()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListTableViewCell", for: indexPath) as! ChatListTableViewCell
//        cell.textLabel?.text = "Hello World"
        cell.setUp(chatList: chatLists[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = ChatViewController()
//        vc.title = "Jenny Smith"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    private func fetchConversations() {

    }

}

