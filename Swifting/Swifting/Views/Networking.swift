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
    func fetch_cryptos() {
        guard let url = URL(string: "https://api.coincap.io/v2/assets") else {
            print("Check URL String, probaly missing or invalid")
            return
        }
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            if let converted_json = try? JSONSerialization.jsonObject(with: data!, options: []) {
                print(converted_json)
            }
            
        }.resume()
        
     
    }
    
}
