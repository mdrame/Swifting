//
//  ATMNearBy.swift
//  Swifting
//
//  Created by Mohammed Drame on 11/4/21.
//

import Foundation


struct ATMsNearBy: Codable {
    let venues: [Venue]
}

// MARK: - Venue
struct Venue: Codable  {
    let id, lat, lon: Float
    let category: String
    let name: String
    let created_on: Float
    let geolocation_degrees : String
}


// MARK: - Welcome9
struct Location: Codable {
    let atm: ATM
}

// MARK: - Venue
struct ATM: Codable {
    let category, state: String
    let fax: String
    let updatedOn: Int
    let logo: String
    let name, country: String
    let openingHours, logoURL: String
    let nameASCII: String
    let website: String
    let venueDescription: String
    let atmProviderName, coupon: String
    let street, facebook: String
    let location, atmOperatorName, couponExpiration: String
    let id: Int
    let houseno, twitter: String
    let promotedUntil: String
    let parking: String
    let couponDescription, srcID: String
    let city: String
    let instagram, premiumUntil, dailyLimits: String
    let lat: Double
    let postcode, email: String
//    let createdOn: Int
    let lon: Double
    let phone: String
    let coins: [String] // ANY ‼️
    let user: User
    let geolocationDegrees: String
}

// MARK: - User
struct User: Codable {
    let userhash: String
}
