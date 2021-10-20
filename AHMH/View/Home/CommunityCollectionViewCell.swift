//
//  CommunityCollectionViewCell.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/20.
//

import UIKit

class CommunityCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CommunityCollectionViewCell.self)

    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var categoryTitle: UILabel!
    
    func setup(category: CommunityCategory) {
        categoryTitle.text = category.name
        categoryImageView.image = UIImage(data: category.image)
    }

}
