//
//  ViewController.swift
//  week9_mission_api connection
//
//  Created by p_kxn_g on 2023/11/27.
//

import UIKit

class ViewController: UIViewController {
    var content: [String: Any] = [:] // content를 빈 딕셔너리로 초기화

    @IBOutlet weak var LabelOfBicycle: UILabel!
    @IBAction func ButtonAPIConnection(_ sender: Any) {
        LabelOfBicycle.text = "connection complete"
        print("button clicked")
            let session = URLSession.shared
            let url = URL(string: "http://openapi.seoul.go.kr:8088/68666967587061723935715a696353/json/bikeList/1/5/")
            let request = URLRequest(url: url!)
            let task = session.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    print("Error: \(error!.localizedDescription)")
                    return
                }

                guard let data = data else {
                    print("No data received")
                    return
                }

                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let rentBikeStatus = jsonObject["rentBikeStatus"] as? [String: Any],
                           let row = rentBikeStatus["row"] as? [[String: Any]],
                           let firstStation = row.first {
                            // 첫 번째 역의 정보를 content에 저장
                            self.content = firstStation
                        } else {
                            // 데이터 추출에 실패했을 경우 예외 처리
                            print("Failed to extract station information.")
                        }
                    
                    
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
            task.resume()
    }

    @IBAction func complete(_ sender: Any) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: content, options: [])
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                // JSON 문자열을 LabelOfBicycle의 text에 할당
                LabelOfBicycle.text = jsonString
                print(jsonString)
            } else {
                print("Failed to convert dictionary to string.")
            }
        } catch {
            print("JSON serialization error: \(error.localizedDescription)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

