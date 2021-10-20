//
//  UIView+Extension.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/20.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}


