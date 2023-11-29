//
//  UserFeedDataManager.swift
//  CatStaGram
//
//  Created by 김세아 on 11/29/23.
//

import Alamofire

class UserFeedDataManager {
    // MARK: 유저 피드 조회
    func getUserFeed(_ viewController: ProfileViewController,
                     _ userID: Int = 2) {
        
        // FeedModel을 배열의 형태로 받아올 것임을 명시 -> 이후 통신 진행
        
        AF.request("https://edu-api-ios-test.softsquared.com/users/\(userID)",
                   method: .get,
                   parameters: nil)
        .validate()
        .responseDecodable(of: UserFeedModel.self) { response in
            
            //연동되었을 때 어떤 행동을 할 것인가?
            
            switch response.result {
            case .success(let result):
                viewController.successFeedAPI(result)
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }

    // MARK: 게시물 삭제 API
    func deleteUserFeed(_ viewController: ProfileViewController,
                     _ postIdx: Int) {
        
        // FeedModel을 배열의 형태로 받아올 것임을 명시 -> 이후 통신 진행
        
        AF.request("https://edu-api-ios-test.softsquared.com/posts/\(postIdx)",
                   method: .get,
                   parameters: nil)
            .validate()
            .responseDecodable(of: UserFeedModel.self) { response in
                
            //연동되었을 때 어떤 행동을 할 것인가?
            
            switch response.result {
            case .success(let result):
                viewController.successDeletePostAPI(result.isSuccess ?? false)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
}
