//
//  EnrollBabySitterViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/22.
//

import UIKit

class EnrollBabySitterViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet var sitterImageVIew: UIImageView!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var genderTextField: UITextField!
    @IBOutlet var simpleIntroductionTF: UITextField!
    @IBOutlet var certificationTF: UITextField!
    @IBOutlet var wageTF: UITextField!
    
    @IBOutlet var introductionTextView: UITextView!
    
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        sitterImageVIew.addGestureRecognizer(tapGesture)
        sitterImageVIew.isUserInteractionEnabled = true

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "등록", style: .plain, target: self, action: #selector(enrollBabySitterToDB))
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    
    // - 돌보미 등록하기
    @objc func enrollBabySitterToDB() {
        
        let AC = UIAlertController(title: "돌보미 등록", message: "돌보미로 등록 하시겠습니까?", preferredStyle: .alert)
        
        AC.addAction(UIAlertAction(title: "예", style: .default, handler: { [self] _ in
            self.navigationController?.popViewController(animated: true)
            // Firebase DB에 등록
            
        }))
        
        AC.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
        present(AC, animated: true, completion: nil)
        
    }
    
    @objc func pickImage() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
        var newImage: UIImage? = nil
            
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage
        }
        
        self.sitterImageVIew.image = newImage
        picker.dismiss(animated: true, completion: nil)
    }
}
