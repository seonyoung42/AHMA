//
//  UserViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/17.
//

import UIKit
import FirebaseAuth


class UserViewController: UIViewController {
    
    
    @IBOutlet var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.contentMode = .scaleAspectFill
        profileImage.backgroundColor = .white
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.blue.cgColor
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.width/2
        
        createUserProfile()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("ERROR: signout \(signOutError.localizedDescription)")
        }
    }
    
   
    @IBAction func profileUpdateButtonTapped(_ sender: Any) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = "선영"
        changeRequest?.commitChanges { _ in
            let displayName = Auth.auth().currentUser?.displayName ?? Auth.auth().currentUser?.email ?? "고객"
        }
    }
    
    func createUserProfile() {
        guard let userEmail = UserDefaults.standard.value(forKey: "email") as? String else {
            return
        }
        
        let safeEmail = DatabaseManager.safeEmail(emailAddress: userEmail)
        let fileName = safeEmail + "_profile_picture.png"
        let path = "images/"+fileName
        
        StorageManager.shared.downloadURL(for: path, completion: { [weak self] result in
            switch result {
            case .success(let url):
                print("success downloadURL - userview")
                self?.downloadImage(imageView: (self?.profileImage)!, url: url)
            case .failure(let error):
                print("Failed to get download url: \(error)")
            }
        })
        
    }
    
    func downloadImage(imageView: UIImageView, url: URL) {
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                imageView.image = image
            }
            
        }).resume()
    }
    
}
