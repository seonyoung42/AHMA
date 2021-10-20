//
//  ChatUser.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/19.
//

import Foundation
import MessageKit

struct ChatUser: SenderType, Equatable {
    
    var photoURL: String
    var senderId: String
    var displayName: String
}
