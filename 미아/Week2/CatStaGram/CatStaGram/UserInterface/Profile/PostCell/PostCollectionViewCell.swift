//
//  PostCollectionViewCell.swift
//  CatStaGram
//
//  Created by 김세아 on 11/19/23.
//

import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    //외부에서 접근해서 해당 ImageView를 변경할 수 있도록 하기 위해 아래 코드 작성
    public func setupData(_ imageURLStr: String?) {
        
        // 이미지 뷰의 이미지 업로드
        
        // optional 해제
        guard let imageURLStr = imageURLStr else { return }
        
        //url type 변환
        if let url = URL(string: imageURLStr) {
            postImageView.kf.setImage(with: url, 
                                      placeholder: UIImage(systemName: "photo"))
        }
    }
}
