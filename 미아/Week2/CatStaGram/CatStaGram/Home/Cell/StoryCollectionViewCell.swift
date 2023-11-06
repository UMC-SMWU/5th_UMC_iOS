//
//  StoryCollectionViewCell.swift
//  CatStaGram
//
//  Created by 김세아 on 11/6/23.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewImageViewBackground: UIView!
    @IBOutlet weak var viewUserProfileBackground: UIView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewImageViewBackground.layer.cornerRadius = 22
        viewUserProfileBackground.layer.cornerRadius = 20.5
        imageViewUserProfile.layer.cornerRadius = 19.5
        imageViewUserProfile.clipsToBounds = true
        // Initialization code
    }

}
