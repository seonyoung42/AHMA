//
//  FacilityTableViewCell.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/21.
//

import UIKit

class FacilityTableViewCell: UITableViewCell {
    
    @IBOutlet var facilityImage: UIImageView!
    @IBOutlet var facilityName: UILabel!
    @IBOutlet var facilityAddress: UILabel!
    @IBOutlet var facilityPeriod: UILabel!
    @IBOutlet var cellView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        
        self.cellView.layer.cornerRadius = 30
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.1
        contentView.layer.shouldRasterize = true
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 10
        
//        contentView.layer.masksToBounds = false
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15))

        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = CGColor(red: 255/255, green: 146/255, blue: 146/255, alpha: 1)
        contentView.layer.cornerRadius = 30
        
    }
    


}
