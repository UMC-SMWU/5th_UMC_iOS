//
//  SeoulBicycle.swift
//  week9_mission_api connection
//
//  Created by p_kxn_g on 2023/11/27.
//

import Foundation
// 따릉이 api를 통해 데이터를 받아오기 위한 데이터 구조
// MARK: - Welcome
struct SeoulBicycle: Codable {
    let rentBikeStatus: RentBikeStatus
}

// MARK: - RentBikeStatus
struct RentBikeStatus: Codable {
    let listTotalCount: Int
    let result: Result
    let row: [Row]

    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case result = "RESULT"
        case row
    }
}

// MARK: - Result
struct Result: Codable {
    let code, message: String

    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case message = "MESSAGE"
    }
}

// MARK: - Row
struct Row: Codable {
    let rackTotCnt, stationName, parkingBikeTotCnt, shared: String
    let stationLatitude, stationLongitude, stationID: String

    enum CodingKeys: String, CodingKey {
        case rackTotCnt, stationName, parkingBikeTotCnt, shared, stationLatitude, stationLongitude
        case stationID = "stationId"
    }
}
