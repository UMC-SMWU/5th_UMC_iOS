//
//  DeleteUserFeed.swift
//  CatStaGram
//
//  Created by 김세아 on 11/29/23.
//

import Foundation

struct DeleteUserFeed: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}
