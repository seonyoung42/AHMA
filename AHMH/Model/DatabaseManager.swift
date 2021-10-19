//
//  DatabaseManager.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/19.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    
}

// - Account ManageMent
extension DatabaseManager {
    
    public func userExists(with email: String,
                           completion: @escaping ((Bool)-> Void)) {
        database.child(email).observeSingleEvent(of: .value) { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            
            completion(true)
            
        }
    }
    
    
    // Insert new user to database
    public func insetUser(with user: ChatAppUser) {
        database.child(user.safeEmail).setValue([
            "firstName" : user.firstName,
            "lastName" : user.lastName
//            "displayName": user.displayName
        ])
    }
}


struct ChatAppUser {
    let firstName : String
    let lastName : String
//    let displayName: String
    let emailAddress: String
//    let profilePictureURL: String
    var safeEmail : String {
        var safeEmail = emailAddress.replacingOccurrences(of: "@", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: ".", with: "-")
        return safeEmail
    }
}
