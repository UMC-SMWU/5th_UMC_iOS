//
//  ProfileCollectionViewCell.swift
//  CatStaGram
//
//  Created by 김세아 on 11/19/23.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var addProfileImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var addFriendButton: UIButton!
    
    @IBOutlet weak var postingCountLabel: UILabel!
    @IBOutlet weak var FollowerCountLabel: UILabel!
    @IBOutlet weak var FollowingCountLabel: UILabel!
    
    
    //정적 변수를 활용해 collectionView가 생성할 Cell이 이 파일임을 알림
    static let identifier = "ProfileCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
    }

    private func setupAttribute() {
        profileImageView.layer.cornerRadius = 88 / 2
        addProfileImageView.layer.cornerRadius = 24 / 2
        
        profileImageView.layer.borderColor = UIColor.darkGray.cgColor
        profileImageView.layer.borderWidth = 1
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        addFriendButton.layer.cornerRadius = 3
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButton.layer.borderWidth = 1
        
        [postingCountLabel, FollowerCountLabel, FollowingCountLabel].forEach{ $0.text = "\(Int.random(in: 0...10))"}
    }
    
}
