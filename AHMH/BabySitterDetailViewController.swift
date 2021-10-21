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
        
        self.view.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: CGColor(red: 252/255, green: 243/255, blue: 202/255, alpha: 1))
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.bubble"), style: .plain, target: self, action: #selector(messageButtonTapped))
        
        messageButton.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
    }

    @objc func messageButtonTapped() {
        
//        dismiss(animated: true, completion: nil)
        let vc = ChatViewController()
//        let navVC = UINavigationController(rootViewController: vc)
        self.navigationController?.pushViewController(vc, animated: true)
//        present(vc, animated: true, completion: nil)
    }
}
