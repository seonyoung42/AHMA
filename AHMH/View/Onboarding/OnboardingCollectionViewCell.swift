//
//  OnboardingCollectionViewCell.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/20.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCollectionViewCell"
    
    @IBOutlet var slideTitleLabel: UILabel!
    @IBOutlet var slideDescriptionLabel: UILabel!
    @IBOutlet var slideImageView: UIImageView!

    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
}
