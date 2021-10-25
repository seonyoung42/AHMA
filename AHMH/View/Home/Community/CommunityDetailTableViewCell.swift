//
//  CommunityDetailTableViewCell.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/25.
//

import UIKit

class CommunityDetailTableViewCell: UITableViewCell {
    
    static let identifier = "CommunityDetailTableViewCell"
    

    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userTime: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(communityDetail: CommunityDetail) {
        
        userImageView.image = communityDetail.userImage
        userName.text = communityDetail.userName
        userTime.text = communityDetail.userTime
        title.text = communityDetail.title
        content.text = communityDetail.content
        
    }
}
