//
//  BabySitterDetailViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/17.
//

import UIKit

class BabySitterDetailViewController: UIViewController {
    
    @IBOutlet var messageButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageButton.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
    }

    @objc func messageButtonTapped() {
        let vc = ChatViewController()
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true, completion: nil)
    }
}
