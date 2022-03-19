//
//  ShoppincartModel.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 22/01/22.
//

import Foundation
    
// MARK: - ShoppingCart
struct ShoppingCart: Codable {
    let uuid: String?
    let user: Int?
    let products: [Product2]?
    let createdAt, updatedAt: String?
    let status: Bool?
    let id: String?
    let totalProducts, subtotal: Int?
    let shippingMethod: ShippingMethod?
    let total: Int?
}

// MARK: - Product
struct Product2: Codable {
    let id: String?
    let code: String?
    let name: String?
    let categoryCode, brandCode, originalBrandCode, genderCode: Int?
    let styleCode: Int?
    let productDescription: String?
    let colorCode: Int?
    let modelCode: String?
    let sublineCode, price, savingPrice, percentagePrice: Int?
    let creditPrice, discountPrice, partiality: Int?
    let tags, sizes: [String]?
    let buyDate: String?
    let businesses: [Business]?
    let black: Bool?
    let photos: [Photo]?
    let stores: [Store]?
    let bluePoints: BluePoints?
    let stock: Stock?
    let totalStock, totalSeen, totalSales: Int?
    let codeRetailRocket, url: String?
    let partialityPrice: Int?
    let shortDescription: String?
    let uniqueProduct, restricted: Bool?
    let brand: Brand?
    let color: Color?
    let selection: Selection?
    let location: [ProductLocation]?
    let changeQuantity: Bool?
    let selectorQuantity: [SelectorQuantity]?
    let subtotal: Int?
    let recharge: Bool?

    enum CodingKeys: String, CodingKey {
        case id, code, name, categoryCode, brandCode, originalBrandCode, genderCode, styleCode
        case productDescription = "description"
        case colorCode, modelCode, sublineCode, price, savingPrice, percentagePrice, creditPrice, discountPrice, partiality, tags, sizes, buyDate, businesses, black, photos, stores, bluePoints, stock, totalStock, totalSeen, totalSales, codeRetailRocket, url, partialityPrice, shortDescription, uniqueProduct, restricted, brand, color, selection, location, changeQuantity, selectorQuantity, subtotal, recharge
    }
}

// MARK: - BluePoints
struct BluePoints: Codable {
    let status: Bool?
    let code: String?
    let winPercentage, winPercentageCredit, win: Int?
}

// MARK: - Brand
struct Brand: Codable {
    let id: String?
    let code: Int?
    let name: String?
    let image: String?
}

// MARK: - Business
struct Business: Codable {
    let code: Int?
}

enum Code: String, Codable {
    case the09D519 = "09D519"
}

// MARK: - Color
struct Color: Codable {
    let id: String?
    let code: Int?
    let colorCode: String?
    let brandCode: Int?
    let colorDescription: String?

    enum CodingKeys: String, CodingKey {
        case id, code, colorCode, brandCode
        case colorDescription = "description"
    }
}

// MARK: - ProductLocation
struct ProductLocation: Codable {
    let color, locationDescription: String?
    let id: String?
    let size, quantity: Int?
    let full: Bool?
    let available: Int?
    let locations, otherLocations: [OtherLocationElement]?
    let isLocal, expressDelivery: Bool?

    enum CodingKeys: String, CodingKey {
        case color
        case locationDescription = "description"
        case id, size, quantity, full, available, locations, otherLocations, isLocal, expressDelivery
    }
}

// MARK: - OtherLocationElement
struct OtherLocationElement: Codable {
    let sku: String?
    let article: String?
    let stock, size, branch: String?
    let message: String?
    let zone: String?
    let lat, lng: Double?
    let name: String?
}

// MARK: - Photo
struct Photo: Codable {
    let photoDescription: String?
    let angle: Int?
    let isVertical: Bool?

    enum CodingKeys: String, CodingKey {
        case photoDescription = "description"
        case angle, isVertical
    }
}

// MARK: - Selection
struct Selection: Codable {
    let instance: Int?
    let code: String?
    let size: Int?
    let article: String?
    let quantity: Int?
}

// MARK: - SelectorQuantity
struct SelectorQuantity: Codable {
    let value, selectorQuantityDescription: Int?

    enum CodingKeys: String, CodingKey {
        case value
        case selectorQuantityDescription = "description"
    }
}

// MARK: - Stock
struct Stock: Codable {
    let status: Bool?
    let deliveryDays: String?
}

// MARK: - Store
struct Store: Codable {
    let storeID, zoneID: String?
    let stock: Int?

    enum CodingKeys: String, CodingKey {
        case storeID = "storeId"
        case zoneID = "zoneId"
        case stock
    }
}

// MARK: - ShippingMethod
struct ShippingMethod: Codable {
    let name, shippingMethodDescription: String?
    let shippingCost: Int?

    enum CodingKeys: String, CodingKey {
        case name
        case shippingMethodDescription = "description"
        case shippingCost
    }
}
