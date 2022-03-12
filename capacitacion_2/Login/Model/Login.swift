//
//  LoginModel.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 12/03/22.
//

import Foundation

// MARK: - Login
struct Login: Codable {
    let calzzapatoUserId: Int?
    let facebookID: String?
    let profilePhotoID, walletID, shoeSizeID: String?
    let favoriteAddressID, genderID: Int?
    let birthday: String?
    let name, firstLastName, secondLastName, username: String?
    let email, phone, cellphone, reference: String?
    let lastOrderID: Int?
    let token: String?

    enum CodingKeys: String, CodingKey {
        case facebookID = "facebookId"
        case profilePhotoID = "profilePhotoId"
        case walletID = "walletId"
        case shoeSizeID = "shoeSizeId"
        case genderID = "genderId"
        case favoriteAddressID = "favoriteAddressId"
        case birthday, name, firstLastName, secondLastName, username, email, phone, cellphone, reference
        case lastOrderID = "lastOrderId"
        case token, calzzapatoUserId
    }
}
