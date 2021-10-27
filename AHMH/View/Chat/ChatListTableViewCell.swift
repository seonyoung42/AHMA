//
//  ChatListTableViewCell.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/27.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.profileImageView.cornerRadius = profileImageView.bounds.width/2
        self.profileImageView.layer.borderWidth = 3
        self.profileImageView.layer.borderColor = CGColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(chatList: ChatList) {
        
        profileImageView.image = chatList.profileImage
        nameLabel.text = chatList.name
        chatLabel.text = chatList.lastChat
        timeLabel.text = chatList.time
        
    }

}

struct ChatList {
    
    let profileImage: UIImage
    let name, lastChat, time: String
    
}
