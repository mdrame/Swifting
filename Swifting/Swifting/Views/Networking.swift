//
//  Networking.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/19/21.
//

import Foundation
import UIKit



class Networking {
    
    func fetch_cryptos(completion: @escaping (Currency)->Void) {
        guard let url = URL(string: "https://api.coincap.io/v2/assets") else {
            print("Check URL String, probaly missing or invalid")
            return
        }
        _ = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
//            let data = try? JSONSerialization.jsonObject(with: data!, options: [])
//            print(data)
            
            do {
                let result = try? JSONDecoder().decode(Currency.self, from: data!)
//                print(result?.data, "data right after decoding ")
                guard let data = result else {
                    print("No data, after dercording")
                    return
                }
                completion(data) // clsure capture it's value.
//                print(data.data)
            }catch  {
                print("Error decoding json ")
            }
            
        }.resume()
    }
    
    // Write generic function
    func fetchATMNearBy(withurl endPoint: endPoints, completion: @escaping (ATMsNearBy)->Void) {
        guard let url = URL(string: endPoints.coinMap.rawValue) else {
            print("ATM Nearby URL error")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allowsCellularAccess = true
        _ = URLSession.shared.dataTask(with: request) { data, response, error in
           if error != nil {
               print(error?.localizedDescription)
               return
           }
            
//            print(response, "RESPOND")
//            let data = try? JSONSerialization.jsonObject(with: data!, options: [])
//            print(data)
           
           do {
               let result = try? JSONDecoder().decode(ATMsNearBy.self, from: data!)
//                print(result)
               guard let data = result else {
                   print("No data, after dercording ‼️")
                   return
               }
               completion(data) // clsure capture it's value.
//               print(data.venues)
           }catch  {
               print("Error decoding json ")
           }
           
       }.resume()
    }
    
    
}
