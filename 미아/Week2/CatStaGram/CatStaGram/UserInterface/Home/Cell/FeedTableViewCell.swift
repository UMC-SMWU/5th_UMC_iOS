//
//  FeedTableViewCell.swift
//  CatStaGram
//
//  Created by 김세아 on 10/15/23.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageViewFeed: UIImageView!
    @IBOutlet weak var buttonIsHeart: UIButton!
    @IBOutlet weak var buttonIsBookMark: UIButton!
    @IBOutlet weak var LabelHowManyLike: UILabel!
    @IBOutlet weak var labelFeed: UILabel!
    @IBOutlet weak var imageViewMyProfile: UIImageView!
    
    @IBAction func actionIsHeart(_ sender: Any) {
        if buttonIsHeart.isSelected {
            buttonIsHeart.isSelected = false
        } else {
            buttonIsHeart.isSelected = true
        }
    }
    
    @IBAction func actionIsBookMark(_ sender: Any) {
        if buttonIsBookMark.isSelected {
            buttonIsBookMark.isSelected = false
        } else {
            buttonIsBookMark.isSelected = true
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewMyProfile.layer.cornerRadius = 11 //모서리 둥글게 설정
        imageViewMyProfile.clipsToBounds = true //이미지의 모서리도 같이 잘려야 하기 때문에 clipsToBunds 설정
        imageViewUserProfile.layer.cornerRadius = 11 //모서리 둥글게 설정
        imageViewUserProfile.clipsToBounds = true
        
        let fontSize = UIFont.boldSystemFont(ofSize: 9)
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        attributedStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 3))
        
        labelFeed.attributedText = attributedStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
