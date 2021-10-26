//
//  BabySitterDetailViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/17.
//

import UIKit

class BabySitterDetailViewController: UIViewController {
    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    //    @IBOutlet var messageButton: UIButton!
    @IBOutlet var instructionTF: UITextField!
    
    @IBOutlet var instructionTV: UITextView!
    var babySitter : BabySitter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: CGColor(red: 252/255, green: 243/255, blue: 202/255, alpha: 1))
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.bubble"), style: .plain, target: self, action: #selector(messageButtonTapped))
        
        profileImageView.image = babySitter.profileImage
        nameLabel.text = babySitter.name
        ageLabel.text = babySitter.age
        addressLabel.text = babySitter.location
        instructionTF.text = babySitter.instruction
//        messageButton.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
        
        
        profileImageView.cornerRadius = profileImageView.bounds.width/2
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor(cgColor: CGColor(red: 196/255, green: 234/255, blue: 218/255, alpha: 1)).cgColor
        
        instructionTV.layer.borderWidth = 0.5
        instructionTV.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        instructionTV.cornerRadius = 5
    }

    @objc func messageButtonTapped() {
        
//        dismiss(animated: true, completion: nil)
        let vc = ChatViewController()
//        let navVC = UINavigationController(rootViewController: vc)
        self.navigationController?.pushViewController(vc, animated: true)
//        present(vc, animated: true, completion: nil)
    }
}
