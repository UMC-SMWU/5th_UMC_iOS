//
//  UserFeedModel.swift
//  CatStaGram
//
//  Created by 김세아 on 11/29/23.
//

import Foundation


struct UserFeedModel: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: UserFeedModelResults?
}

struct GetUserInfo: Decodable {
    let userIdx: Int?
    let nickName: String?
    let name: String?
    let profileImgUrl: String?
    let website: String?
    let introduction: String?
    let followerCount: Int?
    let followingCount: Int?
    let postCount: Int?
}

struct GetUserPosts: Decodable {
    let postIdx: Int?
    let postImgUrl: String?
}

struct UserFeedModelResults: Decodable {
    let _isMyFeed: Bool?
    let getUserInfo: GetUserInfo?
    let getUserPosts: [GetUserPosts]?
}
