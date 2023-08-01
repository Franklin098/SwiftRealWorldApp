//
//  ConduitService.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 30/07/23.
//

import Foundation

enum AppNetworkError:  Error{
    case invalidURL
    case unableToComplete
    case invalidResponseCode
    case invalidData
    case unableToDecodeResponseData
    case unableToEncodeRequestData
}


final class ConduitService {
    
    
    static let shared = ConduitService()
    
    static let baseURL = "https://api.realworld.io/api"
    static let loginEndpoint = baseURL + "/users/login"
    
    
    func getRequest<T: Decodable>(forResponseType: T.Type, endpointUrl: String, completed: @escaping(Result<T, AppNetworkError>) -> Void ) {
        
        guard let url = URL(string: endpointUrl) else {
            return completed(.failure(.invalidURL))
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { optData, optResponse, error in
            
            if error != nil {
                return completed(.failure(.unableToComplete))
            }
            
            guard let response = optResponse as? HTTPURLResponse, response.statusCode == 200 else {
                return completed(.failure(.invalidResponseCode))
            }
            
            guard let data = optData else {
                return completed(.failure(.invalidData))
            }
            
            guard let decodedResponseData = try? JSONDecoder().decode(T.self, from: data) else {
                return completed(.failure(.unableToDecodeResponseData))
            }
            
            completed(.success(decodedResponseData))
            
        }.resume()
        
    }
    
    func postRequest< REQ: Encodable, RES: Decodable>(requestBody: REQ, forResponseType: RES.Type, endpointUrl: String, completed: @escaping(Result<RES, AppNetworkError>) -> Void ) {
        
        guard let url = URL(string: endpointUrl) else {
            return completed(.failure(.invalidURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        
        guard let encodedRequest = try? JSONEncoder().encode(requestBody) else {
            return completed(.failure(.unableToEncodeRequestData))
        }
        
        request.httpBody = encodedRequest
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        print("request: \(String(describing: String(data: encodedRequest, encoding: String.Encoding.utf8)))")

        
        URLSession.shared.dataTask(with: request) { optData, optResponse, error in
            
            if error != nil {
                return completed(.failure(.unableToComplete))
            }
            
            guard let response = optResponse as? HTTPURLResponse, response.statusCode == 200 else {
                print("response: \(String(describing: optResponse))")
                if let data = optData {
                    let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    print("error data : \(String(describing: json))")
                }
                return completed(.failure(.invalidResponseCode))
            }
            
            guard let data = optData else {
                return completed(.failure(.invalidData))
            }
            
            guard let decodedResponseData = try? JSONDecoder().decode(RES.self, from: data) else {
                let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                print("data to decode: \(String(describing: json))")
                return completed(.failure(.unableToDecodeResponseData))
            }
            
            completed(.success(decodedResponseData))
            
        }.resume()
        
    }
    
    
}
