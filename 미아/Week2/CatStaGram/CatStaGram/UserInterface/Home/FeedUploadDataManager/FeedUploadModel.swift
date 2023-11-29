//
//  FeedUploadModel.swift
//  CatStaGram
//
//  Created by 김세아 on 11/28/23.
//

struct FeedUploadModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult?
}

struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
