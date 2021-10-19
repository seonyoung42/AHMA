//
//  AppDelegate.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/17.
//

import UIKit
import Firebase
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Firebase 초기화 코드
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("ERROR Google Sign In \(error.localizedDescription)")
            return
        }
        
        guard let authentication = user.authentication else {
            return
        }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { [self] _, _ in
            showMainViewController()
//            let email = Auth.auth().currentUser?.email
            print("Did sign in with Google: \(user)")
            
            guard let email = user.profile.email,
                  let firstName = user.profile.givenName,
                  let lastName = user.profile.familyName else {
                return
            }
            
            UserDefaults.standard.set(email, forKey: "email")
            
            let chatUser = ChatAppUser(firstName: firstName, lastName: lastName, emailAddress: email)
            DatabaseManager.shared.insetUser(with: chatUser, completion: { success in
                if success {
                    
                    // upload image
                    if user.profile.hasImage {
                        guard let url = user.profile.imageURL(withDimension: 200) else {
                            return
                        }
                        
                        URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
                            guard let data = data else {
                                return
                            }
                            
                            let filename = chatUser.profilePictureFileName
                            StorageManager.shared.uploadProfilePicture(with: data, fileName: filename, completion: {
                                result in
                                switch result {
                                case .success(let downloadUrl):
                                    UserDefaults.standard.set(downloadUrl, forKey: "profile_picture_url")
                                    print(downloadUrl)
                                case .failure(let error):
                                    print("Storage manager error: \(error)")
                                }
                            })
                        }).resume()
                        
                        
                    }
                    
                   
                }
                
            })
        }
    }
    
    private func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(identifier: "TabbarController")
        mainViewController.modalPresentationStyle = .fullScreen
        UIApplication.shared.windows.first?.rootViewController?.show(mainViewController, sender: nil)
    }
    

}

