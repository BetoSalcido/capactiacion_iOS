//
//  ShoppingCartManager.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 19/03/22.
//

import Foundation

class ShoppingCartManager {
    private let netWorkingManager: NetWorkingManager
    
    init(netWorkingManager: NetWorkingManager) {
        self.netWorkingManager = netWorkingManager
    }
    
    func getShoppingCart(completion: @escaping(Response<ShoppingCart?>) -> Void ) {
        let baseUrl = "https://api.calzzapato.xyz/api/users/cart"
        
        self.netWorkingManager.request(
            url: baseUrl,
            body: [:],
            decode: ShoppingCart.self,
            httpMethod: .GET) { response, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else if let response = response as? ShoppingCart {
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
}
