//
//  UIViewController+Extension.swift
//  CatStaGram
//
//  Created by 김세아 on 2023/09/25.
//

import UIKit

extension UIViewController {
    // 어떤 버튼을, 텍스트를, 폰트를, 색상을 파라미터로 받을 것인지 지정. ...의 경우 복수로 지정할 수 있게 해 줌
    // NSMutableAttributedString의 형태로 리턴할 것
    func generateButtonAttribute(_ button: UIButton, texts: String..., fonts: UIFont..., colors: UIColor...) -> NSMutableAttributedString {
        
        // UIButton에 입력된 text를 가져온다.
        guard let wholeText = button.titleLabel?.text else {
            fatalError("버튼에 텍스트가 없음")
        }
        
        // 폰트
        let customFonts: [UIFont] = fonts
        
        // 설정하고자 하는 String의 NSRanges
        let customTextRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])
        }
        
        // 설정하고자 하는 색상들
        let customColors = colors
        
        // attribute 객체 생성
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        
        // 텍스트에 맞는 설정 추가
        texts.indices.forEach { index in
            attributedString.addAttribute(.font, value: customFonts[index], range: customTextRanges[index])
            attributedString.addAttribute(.foregroundColor, value: customColors[index], range: customTextRanges[index])
        }
        
        return attributedString
    }
}
