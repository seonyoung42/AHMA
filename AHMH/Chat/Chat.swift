//
//  Chat.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/19.
//

import Foundation

struct Chat {
    
    var users: [String]
    var dictionary: [String: Any] {
        return ["users": users]
   }
}

extension Chat {
    init?(dictionary: [String:Any]) {
        guard let chatUsers = dictionary["users"] as? [String] else { return nil }
        self.init(users: chatUsers)

    }
}
