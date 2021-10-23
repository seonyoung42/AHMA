//
//  JournalCollectionViewCell.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/24.
//

import UIKit

class JournalCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "JournalCollectionViewCell"
   
    @IBOutlet var journalImageView: UIImageView!
    @IBOutlet var journalTitle: UILabel!
    
    func setup(journal: Journal) {
        journalTitle.text = journal.title
        journalImageView.image = journal.image
//        BookTitle.text = book.title
//        BookAuthor.text = book.author
//        BookImageView.image = UIImage(data: book.image)
    }
}
