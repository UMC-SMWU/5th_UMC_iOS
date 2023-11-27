//
//  Network.swift
//  week9_mission_api connection
//
//  Created by p_kxn_g on 2023/11/27.
//
/// Network.swift

import Foundation
import SwiftUI

struct Network {
    // API 링크
    let bicycleURL = "http://openapi.seoul.go.kr:8088/68666967587061723935715a696353/json/bikeList"
    
    // 날씨 앱이니까 원하는 곳의 URL을 구성해야 하므로, fetchWeather 메서드를 이용하여 원하는 URL을 구해옴
    func fetchIndex(start: Int, end : Int) {
        var stringStart = String(start)
        var stringEnd = String(end)
        let urlString = "\(bicycleURL)/\(stringStart)/\(stringEnd)\""
        // 만든 URL을 performRequest로 전달
        performRequest(urlString: bicycleURL)
    }
    // 네트워킹 4단계를 수행할 곳
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
        
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
            
            task.resume()
        }
    }
    func handle(data: Data?, response: URLResponse?, error: Error?)-> Void {
        if error != nil {
            print(error!)
            return
        }
        // 에러가 발생하지 않았다면 if let 구문으로 들어와 data(옵셔널 데이터)를 언래핑 하게 된다.
       // data는 문자열로 쉽게 출력할 수 있다.
       if let safeData = data {
           // data를 문자열로 출력하는 방법
           // 언래핑한 data를 .utf8 인코딩 방식으로 String 으로 변환
           let dataString = String(data: safeData, encoding: .utf8)
           print(dataString!)
           self.parseJSON(bicycleData: safeData)

       }
    }
    func parseJSON(bicycleData: Data) {
        let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(SeoulBicycle.self, from: bicycleData)
                print(decodedData.rentBikeStatus)
                
            } catch {
                print(error)
            }
        }
    
}
