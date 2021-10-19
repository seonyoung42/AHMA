//
//  StorageManager.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/19.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    
    static let shared = StorageManager()
    private let storage = Storage.storage().reference()
    
    /*
     /images/sumwarrant-gamil-com_profile_picture.png
     */
    
    public typealias UploadPictureCompletion = (Result<String,Error>) -> Void
    
    // Upload picture to firebase storage and returns completion with url string to download
    public func uploadProfilePicture(with data: Data, fileName: String, completion: @escaping UploadPictureCompletion) {
        storage.child("images/\(fileName)").putData(data, metadata: nil) { metadata, error in
            guard error == nil else {
                print("failed to upload data to firebase for picture")
                completion(.failure(StorageError.failedToUpload))
                return
            }
            
            let reference = self.storage.child("images/\(fileName)").downloadURL(completion: { url,error in
                guard let url = url else {
                    print("failed to get download URL")
                    completion(.failure(StorageError.failedToDownloadUrl))
                    return
                }
                
                let urlString = url.absoluteString
                print("download url returned: \(urlString)")
                completion(.success(urlString))
            })
        }
    }
    
    public enum StorageError: Error {
        case failedToUpload
        case failedToDownloadUrl
    }
    
    public func downloadURL(for path: String, completion: @escaping (Result<URL, Error>) -> Void) {
        let reference = storage.child(path)
        
        reference.downloadURL(completion: {url, error in
            guard let url = url, error == nil else {
                completion(.failure(StorageError.failedToDownloadUrl))
                return
            }
            print("downloadURL - success")
            completion(.success(url))
        })
    }
}
