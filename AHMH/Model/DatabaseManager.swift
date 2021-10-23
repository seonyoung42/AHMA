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
    
    static func safeEmail(emailAddress: String) -> String {
        var safeEmail = emailAddress.replacingOccurrences(of: "@", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: ".", with: "-")
        return safeEmail
    }
    
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
    public func insetUser(with user: ChatAppUser, completion: @escaping(Bool) -> Void) {
        database.child(user.safeEmail).setValue([
            "firstName" : user.firstName,
            "lastName" : user.lastName
        ], withCompletionBlock: { error, _ in
            guard error == nil else {
                print("failed to insert user to database")
                completion(false)
                return
            }
            
            self.database.child("users").observeSingleEvent(of: .value, with: { snapshot in
                if var usersCollection = snapshot.value as? [[String: String]] {
                    
                    // append to user dictionary
                    let newElement = [
                        "name": user.firstName + " " + user.lastName,
                        "email": user.safeEmail
                    ]
                    
                    usersCollection.append(newElement)
                    
                    self.database.child("users").setValue(usersCollection, withCompletionBlock: { error, _ in
                        guard error == nil else {
                            completion(false)
                            return
                        }
            
                        completion(true)
                    })
                    
                } else {
                    
                    // create array
                    let newCollection: [[String: String]] = [
                        [
                            "name": user.firstName + " " + user.lastName,
                            "email": user.safeEmail
                        ]
                    ]
                    
                    self.database.child("users").setValue(newCollection, withCompletionBlock: { error, _ in
                        guard error == nil else {
                            completion(false)
                            return
                        }
            
                        completion(true)
                    })
                }
            })
            completion(true)
        })
    }
}


struct ChatAppUser {
    let firstName : String
    let lastName : String
    let emailAddress: String
//    let profilePictureURL: String
    var safeEmail : String {
        var safeEmail = emailAddress.replacingOccurrences(of: "@", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: ".", with: "-")
        return safeEmail
    }
    
    var profilePictureFileName: String {
        return "\(safeEmail)_profile_picture.png"
    }
}
