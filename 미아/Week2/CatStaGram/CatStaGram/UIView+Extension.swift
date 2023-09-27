//
//  UIView+Extension.swift
//  CatStaGram
//
//  Created by 김세아 on 2023/09/25.
//

import UIKit

extension UIView {
    // 모서리를 둥글게
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
