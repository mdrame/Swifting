//
//  Venue.swift
//  Swifting
//
//  Created by Mohammed Drame on 3/26/22.
//

import Foundation

struct Welcome8: Codable {
    let venue: AtmVenue
}

// MARK: - Venue
struct AtmVenue: Codable {
    let lat: Double
//    let city
//    let email, premiumUntil: String
    let lon: Double
//    let postcode, phone: String
    let createdOn: Int
    let category, state: String
//    let fax: String
    let updatedOn: Int
//    let logo: String
    let name, country: String
//    let logoURL, nameASCII: String
    let website: String
//    let description: String
    let street: String
//    let facebook: String
    let id: Int
    let houseno: String
//    let twitter, promotedUntil: String
    let srcID: String
//    let instagram: String
//    let coins: [Any?]
//    let user: atmUser
    let geolocationDegrees: String
}

// MARK: - User
struct atmUser: Codable {
    let userhash: String
}
