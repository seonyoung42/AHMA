//
//  EnrollBabySitterViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/22.
//

import UIKit

class EnrollBabySitterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "등록", style: .plain, target: self, action: #selector(enrollBabySitterToDB))
    }
    
    @objc func enrollBabySitterToDB() {
        
        let AC = UIAlertController(title: "돌보미 등록", message: "돌보미로 등록 하시겠습니까?", preferredStyle: .alert)
        
        AC.addAction(UIAlertAction(title: "예", style: .default, handler: { [self] _ in
            self.navigationController?.popViewController(animated: true)
            // Firebase DB에 등록
            
        }))
        AC.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
       
        present(AC, animated: true, completion: nil)
        
    }

}
