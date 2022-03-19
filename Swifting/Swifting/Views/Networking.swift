//
//  Networking.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/19/21.
//

import Foundation
import UIKit

public enum URLSessionError: String, Error {
    case badURL
    case noDataAfterDecoding
    case badRespond
    case errorDecodingJson
    case UnknowRespondCode
}

public class Networking {
     func fetch_cryptos(completion: @escaping (Result<Currency, URLSessionError>)->Void) {
        guard let url = URL(string: "https://api.coincap.io/v2/assets") else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do {
                let decodedCurrencies = try? JSONDecoder().decode(Currency.self, from: data!)
    //            guard let currencies = decodedCurrencies else {
    //                print("No data after decoding JSON")
    //                return nil
    //            }
                print("JSON: \(decodedCurrencies)")
//                return decodedCurrencies
            }catch  {
                print("Unable to decode data")
            }
//            guard let decodedCurrencies = self.currencyDecoder(data: data) else {
//                completion(.failure(.noDataAfterDecoding))
//                return
//            }
//            if let respond = response as? HTTPURLResponse {
//                switch respond.statusCode {
//                case 200:
//                    guard let decodedCurrencies = self.currencyDecoder(data: data) else {
//                        completion(.failure(.noDataAfterDecoding))
//                        return
//                    }
//                    completion(.success(decodedCurrencies))
//                default:
//                    completion(.failure(.UnknowRespondCode))
//                }
//            }
        }.resume()
    }
    /// Helper function for decoding JSON.
    private func currencyDecoder(data crypto: Data?)-> Currency? {
        do {
            let decodedCurrencies = try? JSONDecoder().decode(Currency.self, from: crypto!)
//            guard let currencies = decodedCurrencies else {
//                print("No data after decoding JSON")
//                return nil
//            }
            print("JSON: \(decodedCurrencies)")
            return decodedCurrencies
        }catch  {
            print("Unable to decode data")
        }
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
