//
//  NetWorkingManager.swift
//  TrialApp
//
//  Created by Beto Salcido on 03/02/22.
//  Copyright © 2022 Etips. All rights reserved.
//

import Foundation
typealias JSONTaskCompletionHandler = (Decodable?, Error?) -> Void

class NetWorkingManager {
    
    /// Performs a network request with the given `URLRequest`.
    /// - Parameters:
    ///   - url:  The `Url` to be sent.
    ///   - body: The `params or data` to be sent.
    ///   - decode: The `Type of Model` to make the `JSONDecoder`.
    ///   - httpMethod: The `httpMethod` required to make the request.
    ///   - completion: The completion closure to be called when the network request completes.
    func request<T: Decodable>(url: String,
                               body: [String:Any],
                               decode: T.Type,
                               httpMethod: HttpMethod,
                               completionHandler completion: @escaping JSONTaskCompletionHandler) {
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let request = self?.prepareRequest(withURL: url, body: body, httpMethod: httpMethod) else {
                completion(nil, CodeError.invalidRequest)
                return
            }
            
            let sessionConfiguration = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfiguration)
            let task = session.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    DispatchQueue.main.async {
                        completion(nil, error)
                        return
                    }
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completion(nil, CodeError.serverError)
                    return
                }
                
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            if response.statusCode != 200  {
                                completion(nil, CodeError.invalidRequest)
                                
                            } else {
                                let result = try JSONDecoder().decode(decode, from: data)
                                completion(result, nil)
                            }
                            
                        } catch {
                            completion(nil, error)
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
}

// MARK: - Private Methods
private extension NetWorkingManager {
    
    /// Prepare a `URLRequest` with the given information.
    /// - Parameters:
    ///   - stringURL: The `stringURL` to be sent.
    ///   - body: The `params or data` to be sent.
    ///   - httpMethod: The `httpMethod` required to make the request.
    /// - Returns: The `URLRequest` to be sent.
    func prepareRequest(withURL stringURL: String,
                        body: [String:Any],
                        httpMethod: HttpMethod) -> URLRequest? {
        
        let jsonUrlString = httpMethod == .GET ? stringURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) : stringURL
        
        guard let url = URL(string: jsonUrlString ?? "") else { return nil }
        var request = URLRequest(url: url)
        
        request.httpMethod = httpMethod.rawValue
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("identity", forHTTPHeaderField: "Accept-Encoding")
        
        if httpMethod != .GET {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        return request
    }
}

// MARK: - NetworkingManager Custom Types
extension NetWorkingManager {
    enum HttpMethod: String {
        case GET
        case POST
        case PUT
        case PATCH
        case DELETE
    }
}

