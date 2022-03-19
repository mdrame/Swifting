//
//  Currency.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/19/21.
//

import Foundation



struct Currency: Codable {
//    var id =  UUID().uuidString
    let data: [[String: String?]]
    let timestamp: Int
    // Coding Keys
//    private enum CoingKeys: String, CodingKey {
//        case time = "timestamp"
//    }
}

struct Crypto: Codable {
    var id: String
    var name: String
    var priceUsd: String
    var rank: String
//    var symbol: String
//    var supply: String
    var maxSupply: String
    var marketCapUsd: String
    var volumeUsd24Hr: String
    var isFavorite: Bool
}
