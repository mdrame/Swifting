//
//  Networking.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/19/21.
//

import Foundation
import UIKit
import CloudKit
import AVFoundation

public enum URLSessionError: String, Error {
    case badURL
    case unableToDecodeJSON
    case noDataAfterDecoding
    case badRespond
    case errorDecodingJson
    case UnknowRespondCode
    case clientError
    case serverError
}

public class Networking {
    
    func fetchData<Element:Codable>(with url: endPoints, completion: @escaping (Result<Element,URLSessionError>)->Void) {
        guard let baseURL = URL(string: "\(url.rawValue)") else {
            print("Badd URL")
            return
        }
        let request = URLRequest(url: baseURL)
        URLSession.shared.dataTask(with: request) { apiData , response , networkingError in
            if networkingError != nil {
                print(networkingError?.localizedDescription as Any)
                return
            }
            
            // Handle response case here
            do {
                let decodedData = try? JSONDecoder().decode(Element.self, from: apiData!)
                guard let data = decodedData else {
                    print("No data after downnloading")
                    return
                }
                completion(.success(data))
                print(String(data: data as! Data, encoding: .utf8))
            } catch {
                print("Unable to decode data")
            }
        }.resume()
    }
    
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
                        guard let decodedData = data else { return }
                        completion(.success(decodedData))
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
            return nil
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
    
    func fetchATM(with endpoint: endPoints, at coordinate: Int, completion: @escaping (Result<Welcome8, URLSessionError>)->Void ) {
        guard let url = URL(string: "\(endpoint.rawValue)/\(coordinate)") else {
            print("Badd URL")
            return
        }
        print("URL 🕸: ",url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { atm , networkRespond, networkError  in
            if networkError != nil {
                print(networkError?.localizedDescription)
                completion(.failure(.serverError))
                return
            }
            //            if let respond = networkRespond as? HTTPURLResponse {
            //                switch respond.statusCode {
            //                case 200:
            //                    print("Good respond")
            do {
                let decodedData = try? JSONDecoder().decode(Welcome8.self, from: atm!)
                print("Decoded Data:", decodedData)
                guard let atm = decodedData else {
                    print("No data after decoding")
                    completion(.failure(.noDataAfterDecoding))
                    return
                }
                completion(.success(atm))
            } catch {
                completion(.failure(.unableToDecodeJSON))
                print("Unable to decode JSON")
            }
            //                default:
            //                    print("No respond")
            //                }
            //            }
        }.resume()
        
    }
    
    //
    
    func uploadVideo(video: [String: String], completed: @escaping (Result<Currency, URLSessionError>)->Void) {
        // pretend url is Database(Firebase)
//        guard let url = URL(string: "https://api.coincap.io/v2/assets") else {
//            completed(.failure(.badURL))
//            return
//        }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        // convert dic to data and assing to reuest body.
////        request.httpBody = ["Header": "Message body (Video)"]
//        let defaultSesson = URLSession(configuration: .default)
//        defaultSesson.uploadTask(with: request, from: nil) { data,response,error in [self] in
//            if error != nil {
//                print(error?.localizedDescription)
//                return
//            }
//            if let respond = response as? HTTPURLResponse {
//                switch respond.statusCode {
//                case 200:
//                    do {
//                        var data = currencyDecoder(data: data)
//                        guard let decodedData = data else { return }
//                        completed(.success(decodedData))
//                    } catch {
//                        print("Unbale to decode JSON")
//                        completed(.failure(.unableToDecodeJSON))
//                    }
//                case 400...417:
//                    print("Client Error")
//                    completed(.failure(.clientError))
//                default:
//                    print("No response")
//                }
//            }
//        }.resume()
    }
    
    
}

