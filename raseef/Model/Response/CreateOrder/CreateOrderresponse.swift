//
//  CreateOrderresponse.swift
//  raseef
//
//  Created by Teamx tec on 26/12/2022.
//

import Foundation

// MARK: - Welcome
struct CreateOrderResponse: Codable {
    let orders: [Order]?
}

// MARK: - Order
struct Order: Codable {
    //let customerContact, customer: String?
    //let children: [String]?
    //let status: Status
    let orderStatus: String?
//    let amount, salesTax, total: Int?
//    let paidTotal: Int?
//    let paymentGateway, ridingStatus, shop: String?
//    let discount, deliveryFee, usedPoints: Int?
//    let stripePaymentID: String?
//    let userRiding: Bool?
   // let products: [Product]
//    let id, createdAt, updatedAt: String?
   // let v: Int?

    enum CodingKeys: String, CodingKey {
//        case customerContact = "customer_contact"
//        case customer//, children//, status
        case orderStatus = "order_status"
//        case amount
//        case salesTax = "sales_tax"
//        case total
//        case paidTotal = "paid_total"
//        case paymentGateway = "payment_gateway"
//        case ridingStatus = "riding_status"
//        case shop, discount
//        case deliveryFee = "delivery_fee"
//        case usedPoints = "used_points"
//        case stripePaymentID = "stripe_payment_id"
//        case userRiding = "user_riding"
       // case products
//        case id = "_id"
//        case createdAt, updatedAt
       // case v = "__v"
    }
}

// MARK: - Product
//struct Product: Codable {
//    let id, productID: String?
//    let hasReviewed: Bool?
//    let orderQuantity, unitPrice, subtotal: Int?
//    let createdAt, updatedAt: String?
//    let v: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case productID = "product_id"
//        case hasReviewed = "has_reviewed"
//        case orderQuantity = "order_quantity"
//        case unitPrice = "unit_price"
//        case subtotal, createdAt, updatedAt
//        case v = "__v"
//
//
//    }
//
//}
//// MARK: - Status
//struct Status: Codable {
//    let id, name, color: String?
//    let serial, v: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case name, color, serial
//        case v = "__v"
//    }
//}
