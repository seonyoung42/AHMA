//
//  BookCollectionViewCell.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/20.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BookCollectionViewCell"

    @IBOutlet var BookImageView: UIImageView!
    @IBOutlet var BookTitle: UILabel!
    @IBOutlet var BookAuthor: UILabel!
    
    func setup(book: Book) {
        BookTitle.text = book.title
        BookAuthor.text = book.author
        BookImageView.image = UIImage(data: book.image)
    }
}
