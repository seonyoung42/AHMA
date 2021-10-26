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
    @IBOutlet var locationButton: UIButton!
    @IBOutlet var babySitterButton: UIButton!
    @IBOutlet var logoutButton: UIButton!
    @IBOutlet var profileBackView: CardView!
    @IBOutlet var buttonsBackView: CardView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createUserProfile()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: CGColor(red: 252/255, green: 243/255, blue: 202/255, alpha: 1))
        self.navigationItem.title = "내 정보"
        
        profileImage.contentMode = .scaleAspectFill
        profileImage.backgroundColor = .white
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor(cgColor: CGColor(red: 255/255, green: 171/255, blue: 115/255, alpha: 1)).cgColor
        
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.width/2
        
        profileBackView.layer.cornerRadius = profileBackView.bounds.width/2
                
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.badge.xmark"), style: .plain, target: self, action: #selector(logout))
        
        [locationButton,babySitterButton,logoutButton].forEach {
            
            $0?.layer.borderWidth = 2
            $0?.layer.borderColor = CGColor(red: 255/255, green: 171/255, blue: 115/255, alpha: 1)
            $0?.layer.cornerRadius = 20
            $0?.setTitleColor(UIColor.lightGray, for: .selected)
            
            
            buttonsBackView.layer.cornerRadius = 20
        }
        

        // Do any additional setup after loading the view.
    }
    
//    @objc func logout() {
//        let firebaseAuth = Auth.auth()
//        do {
//            try firebaseAuth.signOut()
//            self.navigationController?.popToRootViewController(animated: true)
//        } catch let signOutError as NSError {
//            print("ERROR: signout \(signOutError.localizedDescription)")
//        }
//    }
    

    @IBAction func logoutButtonTapped(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("Logout - success")
            self.navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("ERROR: signout \(signOutError.localizedDescription)")
        }
    }
    
    
    @IBAction func moveToLocationVC(_ sender: Any) {
        let nextVC = LocationViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
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
