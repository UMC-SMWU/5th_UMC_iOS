//
//  Weather.swift
//  OpenApi
//
//  Created by 김세아 on 11/21/23.
//

// 사용하고 싶은 데이터만 골라 data model 만들기

import Foundation

struct WeatherResponse: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
    let wind: Wind
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let feels_like: Double
    let humidity: Int
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Wind: Decodable {
    let speed: Double
}
