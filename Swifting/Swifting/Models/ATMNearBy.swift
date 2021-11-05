//
//  ATMNearBy.swift
//  Swifting
//
//  Created by Mohammed Drame on 11/4/21.
//

import Foundation


struct ATMNearBy: Codable {
    let venues: [Venue]
}

// MARK: - Venue
struct Venue: Codable  {
    let id, lat, lon, category: String
    let name, createdOn: String
    let created_on : Int
    let geolocation_degrees : String
}

