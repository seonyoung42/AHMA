//
//  LoginViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/18.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import AuthenticationServices
import CryptoKit
import JGProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet var googleLoginButton: GIDSignInButton!
    @IBOutlet var appleLoginButton: UIButton!
    @IBOutlet var contentLabel: UILabel!
    

    private var currentNonce: String?
    private let spinner = JGProgressHUD(style: .dark)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor(cgColor: CGColor(red: 255/255, green: 230/255, blue: 153/255, alpha: 1))
        navigationController?.navigationBar.isHidden = true
        
        //Google Sign In
        GIDSignIn.sharedInstance().presentingViewController = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [googleLoginButton,appleLoginButton].forEach {
            $0?.layer.borderWidth = 2
            $0?.layer.borderColor = CGColor(red: 255/255, green: 146/255, blue: 146/255, alpha: 1)
            $0?.layer.cornerRadius = 30
        }
        
    }
    
    @IBAction func googleLoginButtonTapped(_ sender: Any) {
        spinner.show(in: view)
       
        GIDSignIn.sharedInstance().signIn()
        DispatchQueue.main.async { [self] in
            spinner.dismiss()
        }
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: Any) {
        spinner.show(in: view)
        startSignInWithAppleFlow()
        DispatchQueue.main.async { [self] in
            spinner.dismiss()
        }
    }
    
    
}

extension LoginViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print ("Error Apple sign in: %@", error)
                    return
                }
                
                guard let email = Auth.auth().currentUser?.email,
                      let name = appleIDCredential.fullName,
                      let firstName = name.givenName,
                      let lastName = name.familyName else {
                    return
                }
                
                let chatUser = ChatAppUser(firstName: firstName, lastName: lastName, emailAddress: email)
                DatabaseManager.shared.insetUser(with: chatUser, completion: { success in
                    if success {
                        // upload image
                        
                    }
                    
                })
                
                // User is signed in to Firebase with Apple.
                // ...
                ///Tabbar (main) 화면으로 보내기
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let mainViewController = storyboard.instantiateViewController(identifier: "TabbarController")
                mainViewController.modalPresentationStyle = .fullScreen
                self.navigationController?.show(mainViewController, sender: nil)
            }
        }
    }
}

//Apple Sign in
extension LoginViewController {
    
    func startSignInWithAppleFlow() {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    // Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
}

extension LoginViewController : ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
