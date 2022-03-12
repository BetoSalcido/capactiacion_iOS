//
//  LoginManager.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 12/03/22.
//

import Foundation

class LoginManager {
    private let netWorkingManager: NetWorkingManager
    
    init(netWorkingManager: NetWorkingManager) {
        self.netWorkingManager = netWorkingManager
    }
    
    func getShoppingCart(completion: @escaping(Response<Login?>) -> Void ) {
        let baseUrl = "https://api.calzzapato.xyz/api/users/signin"
       
        self.netWorkingManager.request(url: baseUrl, body: [:], decode: Login.self, httpMethod: .POST) { (response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else if let response = response as? Login {
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            } else {
                DispatchQueue.main.async {
                    completion(.failure(CodeError.invalidResponse))
                }
            }
        }
    }
    
//    func removeProduct(data: UpdateProduct, completion: @escaping(Response<ProductRemoved?>) -> Void ) {
//        do {
//            let jsonData = try data.jsonData()
//            let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
//            guard let body = json as? [String : Any] else {
//                completion(.failure(CodeError.invalidRequest))
//                return
//            }
//
//            var baseUrl = getBaseUrl()
//            baseUrl = "\(baseUrl)\("carts/remove")"
//
//            self.networkingManager.request(url: baseUrl, body: body, decode: ProductRemoved.self, httpMethod: .DELETE) { (response, error) in
//                if let error = error {
//                    DispatchQueue.main.async {
//                        completion(.failure(error))
//                    }
//                } else if let response = response as? ProductRemoved {
//                    DispatchQueue.main.async {
//                        completion(.success(response))
//                    }
//                } else {
//                    DispatchQueue.main.async {
//                        completion(.failure(CodeError.invalidResponse))
//                    }
//                }
//            }
//
//        } catch let error as NSError {
//            print("Failed to load: \(error.localizedDescription)")
//            completion(.failure(CodeError.invalidRequest))
//        }
//    }
}
