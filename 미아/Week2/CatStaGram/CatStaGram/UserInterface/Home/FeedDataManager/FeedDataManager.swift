//
//  FeedDataManager.swift
//  CatStaGram
//
//  Created by 김세아 on 11/27/23.
//
import Alamofire

class FeedDataManager {
    func feedDataManager(_ parameters : FeedAPIInput, _ viewController : HomeViewController) {
        //FeedModel을 배열의 형태로 받아올 것임을 명시
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable(of: [FeedModel].self) {
            response in
            //연동되었을 때 어떤 행동을 할 것인가?
            switch response.result {
            case .success(let result):
                viewController.successAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
