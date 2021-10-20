//
//  Networking.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/19/21.
//

import Foundation
import UIKit



class Networking {
    
    // using escaping closure to caputre Crypto object
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
}
