//
//  ChatUser.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/19.
//

import UIKit
import MessageKit

struct ChatUser: SenderType, Equatable {
    
    var photoimage: UIImage
    var senderId: String
    var displayName: String
}
