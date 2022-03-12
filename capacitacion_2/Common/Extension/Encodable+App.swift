//
//  Encodable+App.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 12/03/22.
//

import Foundation

extension Encodable {
    /// Encode into JSON and return `Data`
    func jsonData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}
