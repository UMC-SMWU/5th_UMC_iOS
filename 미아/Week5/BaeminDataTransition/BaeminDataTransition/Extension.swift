//
//  Extension.swift
//  BaeminDataTransition
//
//  Created by 김세아 on 11/2/23.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat { //둥근 모서리
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat { //테두리 굵기
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
        
        
    @IBInspectable var borderColor: UIColor? { //테두리 색상
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
