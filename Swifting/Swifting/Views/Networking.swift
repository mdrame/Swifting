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
    case unableToDecodeJSON
    case noDataAfterDecoding
    case badRespond
    case errorDecodingJson
    case UnknowRespondCode
    case clientError
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
            if let respond = response as? HTTPURLResponse {
                switch respond.statusCode {
                case 200:
                    do {
                        var data = currencyDecoder(data: data)
                        completion(.success(data!))
                    } catch {
                        print("Unbale to decode JSON")
                        completion(.failure(.unableToDecodeJSON))
                    }
                case 400...417:
                    print("Client Error")
                    completion(.failure(.clientError))
                default:
                    print("No response")
                }
            }
        }.resume()
    }
    
    /// Helper function for decoding JSON.
    private func currencyDecoder(data crypto: Data?)-> Currency? {
        do {
            let decodedCurrencies = try? JSONDecoder().decode(Currency.self, from: crypto!)
            if let crypto = decodedCurrencies {
                return crypto
            }
        } catch {
            print("Unable to decode data")
        }
        return nil
    }
    
    
    // Write generic function
    func fetchATMNearBy(withurl endPoint: endPoints, completion: @escaping (ATMsNearBy)->Void) {
        guard let url = URL(string: endPoint.rawValue) else {
            print("ATM Nearby URL error")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //        request.allowsCellularAccess = true
        URLSession.shared.dataTask(with: request) { data, response, error in
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
    
    func fetchATM(with endpoint: endPoints, at coordinate: Int, completion: @escaping (Result<AtmVenue, Error>)->Void ) {
        guard let url = URL(string: "\(endpoint.rawValue)\(coordinate)") else {
            print("Badd URL")
            return
        }
        print("URL 🕸: ",url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { atm , networkRespond, networkError  in
            if networkError != nil {
                print(networkError?.localizedDescription)
                return
            }
            //            if let respond = networkRespond as? HTTPURLResponse {
            //                switch respond.statusCode {
            //                case 200:
            //                    print("Good respond")
            do {
                let decodedData = try? JSONDecoder().decode(AtmVenue.self, from: atm!)
                guard let atm = decodedData else {
                    print("No data after decoding")
                    return
                }
                completion(.success(atm))
            } catch {
                print("Unable to decode JSON")
            }
            //                default:
            //                    print("No respond")
            //                }
            //            }
        }.resume()
        
    }
    
    
}

