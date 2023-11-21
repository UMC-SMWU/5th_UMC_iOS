//
//  ViewController.swift
//  OpenApi
//
//  Created by 김세아 on 11/21/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var feelingTemp: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    
    
    
    // 받아온 데이터를 저장할 프로퍼티
    var weather: Weather?
    var main: Main?
    var name: String?
    var wind: Wind?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // data fetch
        WeatherService().getWeather { result in
            switch result {
            case .success(let weatherResponse):
                DispatchQueue.main.async {
                    self.weather = weatherResponse.weather.first
                    self.main = weatherResponse.main
                    self.name = weatherResponse.name
                    self.wind = weatherResponse.wind
                    self.setWeatherUI()
                }
            case .failure(_ ):
                print("error")
            }
        }
    }
    
    
    private func setWeatherUI() {
        
        //이미지를 받아온 뒤 imageView에 넣기
        URLSession.shared.dataTask(with: URL(string: "https://openweathermap.org/img/wn/\(self.weather?.icon ?? "")@2x.png")!)
        { [weak self] data, response, error
            in guard let self,
                        let data = data,
                        response != nil,
                        error == nil else { return }
            DispatchQueue.main.async {
                self.iconImageView.image = UIImage(data: data) ?? UIImage()}
        }.resume()
        
       /*
        let url = URL(string: "https://openweathermap.org/img/wn/\(self.weather?.icon ?? "00")@2x.png")
        let data = try? Data(contentsOf: url!)
        if let data = data {
            iconImageView.image = UIImage(data: data)
        } */
        //위 코드는 UI 반응성에 영향을 주므로(작업 처리를 위해 오랜 시간 소요 가능) 동기식으로 작업하지 않기 위해 URLSession을 이용한 방법으로 변경하였음.
        
        // 해당 API 활용 시 온도를 켈빈온도로 받아오므로, 섭씨 변환 단계를 거쳐야 함
        let tempLabelText = Double(main!.temp) - 273.15
        let maxTempLabelText = Double(main!.temp_max) - 273.15
        let minTempLabelText = Double(main!.temp_min) - 273.15
        let feelTempLabelText = Double(main!.feels_like) - 273.15
        
        
        //해당 실수형을 첫째 자리수까지만 보이게 문자형으로 변환하여 출력
        tempLabel.text = String(format: "%.1f", tempLabelText) + "℃"
        maxTempLabel.text = String(format: "%.1f", maxTempLabelText) + "℃"
        minTempLabel.text = String(format: "%.1f", minTempLabelText) + "℃"
        
        feelingTemp.text = String(format: "%.1f", feelTempLabelText) + "℃"
        
        weatherDescription.text = weather!.description
        humidity.text = String(main!.humidity) + "%"
        windSpeed.text = String(wind!.speed) + "m/s"
    }
    
}
