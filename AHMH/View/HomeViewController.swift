//
//  HomeViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/17.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var email = Auth.auth().currentUser?.email ?? "고객"
//        let email = Auth.auth().currentUser?.displayName!
        
        if Auth.auth().currentUser?.displayName != nil {
            email = (Auth.auth().currentUser?.displayName)!
        } else {
            email = Auth.auth().currentUser?.email ?? "고객"
        }
        
        welcomeLabel.text = """
        안녕하세요
        \(email)님
        """
        
        welcomeLabel.textColor = UIColor.black
    }
    
    @IBAction func profileUpdateButtonTapped(_ sender: Any) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = "선영"
        changeRequest?.commitChanges { _ in
            let displayName = Auth.auth().currentUser?.displayName ?? Auth.auth().currentUser?.email ?? "고객"
            self.welcomeLabel.text = """
            안녕하세요 \(displayName)님
            """
            
        }
    }
}
