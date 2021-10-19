//
//  Message.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/19.
//

import Foundation
import Firebase
import MessageKit


struct Message: MessageType {
    
    var sender: SenderType
    var messageId: String 
    var sentDate: Date
    var kind: MessageKind
}

//struct Message {
//    var id: String
//    var content: String
//    var created: Timestamp
//    var senderID: String
//    var senderName: String
//    var dictionary: [String: Any] {
//        return [
//        "id": id,
//        "content": content,
//        "created": created,
//        "senderID": senderID,
//        "senderName":senderName]
//    }
//}
//
//extension Message {
//
//    init?(dictionary: [String: Any]) {
//        guard let id = dictionary["id"] as? String,
//              let content = dictionary["content"] as? String,
//              let created = dictionary["created"] as? Timestamp,
//              let senderID = dictionary["senderID"] as? String,
//              let senderName = dictionary["senderName"] as? String else { return nil }
//
//    self.init(id: id, content: content, created: created, senderID: senderID, senderName:senderName)
//    }
//}
//
//extension Message: MessageType {
//    var sender: SenderType {
//        return ChatUser(senderId: senderID, displayName: senderName)
//    }
//
//    var messageId: String {
//        return id
//    }
//
//    var sentDate: Date {
//        return created.dateValue()
//    }
//
//    var kind: MessageKind {
//        return .text(content)
//    }
//}
