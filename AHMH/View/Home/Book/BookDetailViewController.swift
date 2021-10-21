//
//  BookDetailViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/21.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet var bookImageView: UIImageView!
    @IBOutlet var bookTitle: UILabel!
    @IBOutlet var bookAuthor: UILabel!
    @IBOutlet var bookPublisher: UILabel!
    @IBOutlet var bookPages: UILabel!
    @IBOutlet var bookYear: UILabel!
    
    @IBOutlet var bookDescription: UITextView!
    var book : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        
        // 이름, 이미지url, 저자, 출판사, 총 페이지, 출판 년도, 소개글
        bookTitle.text = book[0]
        bookAuthor.text = book[2]
        bookPublisher.text = book[3]
        bookPages.text = book[4]
        bookYear.text = book[5]
        bookDescription.text = book[7]
        
        let url = URL(string: book[1])
        do {
            let data = try Data(contentsOf: url!)
            bookImageView.image = UIImage(data: data)
        } catch {
            print("Error loading Image by URL")
        }
        
    }

}
