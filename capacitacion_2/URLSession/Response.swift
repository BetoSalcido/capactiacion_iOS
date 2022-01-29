//
//  Response.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 28/01/22.
//

import Foundation
enum Response<T> {
    case success(T)
    case failure(Error)
}

enum CodeError: Error {
    case unknownError
    case connectionError
    case invalidCredentials
    case invalidRequest
    case notFound
    case invalidResponse
    case serverError
    case serverUnavailable
    case timeOut
    case unsuppotedURL
    case next
}
